#!/usr/bin/zsh
# You should change the shebang to `#!/usr/bin/env zsh` if you want to run this script in a different environment.

set -e  # Exit immediately if a command exits with a non-zero status

# ----------------------------------------
# Copy nvim directory to config 
# ----------------------------------------
echo "Copying nvim configuration files to ~/.config/nvim..."
cp -r ./nvim ~/.config/nvim

cp ~/.init-setting/.tmux.conf ~/.tmux.conf
tmux source-file ~/.tmux.conf

# ----------------------------------------
# Check current Neovim version
# ----------------------------------------

install_nvim=false
if command -v nvim >/dev/null; then
    # Get full version string like "NVIM v0.9.5" or "NVIM v0.11.0"
    version_string=$(nvim --version | head -n 1)

    # Extract major and minor version
    version_number=$(echo "$version_string" | sed -n 's/^NVIM v\([0-9]\+\)\.\([0-9]\+\).*/\1 \2/p')
    major=$(echo "$version_number" | awk '{print $1}')
    minor=$(echo "$version_number" | awk '{print $2}')

    if [ -n "$major" ] && [ -n "$minor" ]; then
        if [ "$major" -gt 0 ] || [ "$minor" -ge 9 ]; then
            echo "✅ Neovim version is already v$major.$minor (>= v0.9). Skipping installation."
            install_nvim=false
        else
            echo "⚠️ Neovim version is v$major.$minor (< v0.9). Will install newer version..."
            install_nvim=true
        fi
    else
        echo "⚠️ Could not parse Neovim version. Will reinstall just in case..."
        install_nvim=true
    fi
else
    echo "⚠️ Neovim is not installed. Will install Neovim v0.11.1..."
    install_nvim=true
fi

# ----------------------------------------
# Install Neovim if needed
# ----------------------------------------

if [ "$install_nvim" = true ]; then
    echo "Downloading Neovim..."
    wget https://github.com/neovim/neovim/releases/download/v0.11.1/nvim-linux-x86_64.tar.gz

    echo "Extracting Neovim..."
    tar -xvf nvim-linux-x86_64.tar.gz
    rm nvim-linux-x86_64.tar.gz

    # Add alias to .zshrc if not already present
    if ! grep -q 'alias nvim=' ~/.zshrc; then
        echo 'alias nvim="$(pwd)/nvim-linux-x86_64/bin/nvim"' >> ~/.zshrc
        echo "Alias for nvim added to .zshrc"
    fi

    # Refresh shell
    source ~/.zshrc

    # Verify Neovim version
    echo "Checking Neovim version..."
    nvim_version=$($(pwd)/nvim-linux-x86_64/bin/nvim --version | head -n 1)
    if [[ "$nvim_version" == *"v0.11."* ]]; then
        echo "✅ Neovim v0.11 installed successfully."
    else
        echo "❌ Failed to install Neovim v0.11."
        exit 1
    fi
fi

# ----------------------------------------
# Set Neovim as default editor and vim alternative
# ----------------------------------------

echo "Linking nvim to default editor and vim using update-alternatives..."
sudo update-alternatives --install /usr/bin/editor editor $(pwd)/nvim-linux-x86_64/bin/nvim 100
sudo update-alternatives --install /usr/bin/vim vim $(pwd)/nvim-linux-x86_64/bin/nvim 100

echo "Select default editor manually:"
sudo update-alternatives --config editor

echo "Select default vim manually:"
sudo update-alternatives --config vim

# ----------------------------------------
# Clone Neovim config (assuming GitHub repo exists)
# ----------------------------------------

# ----------------------------------------
# Install plugins using Lazy.nvim
# ----------------------------------------

echo "Running :Lazy sync to install plugins..."
$(pwd)/nvim-linux-x86_64/bin/nvim --headless -c "+Lazy! sync" +qa 

# ----------------------------------------
# Check and install Node.js >= v20, npm >= v9
# ----------------------------------------

echo "Checking Node.js version..."
if command -v node >/dev/null; then
    node_version=$(node -v | cut -d'v' -f2 | cut -d. -f1)
    if [ "$node_version" -lt 20 ]; then
        echo "Old Node.js detected. Removing..."
        sudo apt remove -y nodejs npm
    fi
fi

if ! command -v node >/dev/null || [ "$(node -v | cut -d'v' -f2 | cut -d. -f1)" -lt 20 ]; then
    echo "Installing Node.js v20..."
    curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
    sudo apt install -y nodejs
fi


# Final version check
node_version=$(node -v | cut -d'v' -f2)
npm_version=$(npm -v)

if [[ "$(echo $node_version | cut -d. -f1)" -lt 20 || "$(echo $npm_version | cut -d. -f1)" -lt 9 ]]; then
    echo "⚠️ Node.js v20+ and npm v9+ are required. Current: node=$node_version, npm=$npm_version"
else
    echo "✅ Node.js and npm versions are sufficient."
fi

# ----------------------------------------
# Install cmakelang via pip if not installed
# ----------------------------------------

if ! pip show cmakelang > /dev/null 2>&1; then
    echo "Installing cmakelang via pip..."
    pip install cmakelang
else
    echo "cmakelang already installed."
fi

# ----------------------------------------
# Install Mason packages in Neovim
# ----------------------------------------

echo "Installing Mason packages in Neovim..."
$(pwd)/nvim-linux-x86_64/bin/nvim --headless -c "MasonInstall lua-language-server cmake-language-server json-lsp pyright" +qa

echo "Launching Neovim for Copilot authentication..."
nvim "+Copilot auth" +qa

echo "✅ All setup completed successfully."

