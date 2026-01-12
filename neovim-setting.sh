#!/usr/bin/zsh
# You should change the shebang to `#!/usr/bin/env zsh` if you want to run this script in a different environment.

set -e  # Exit immediately if a command exits with a non-zero status
if [ "$(id -u)" -eq 0 ]; then
  SUDO=""
  SUDO_E=""
else
  SUDO="sudo"
  SUDO_E="sudo -E"
fi

# ----------------------------------------
# Copy nvim directory to config 
# ----------------------------------------
echo "Copying nvim configuration files to ~/.config/nvim..."
# Check if ~/.config exists and is a directory
if [ ! -d "$HOME/.config" ]; then
  echo "Creating ~/.config directory..."
  mkdir "$HOME/.config"
else
  echo "~/.config already exists. Skipping."
fi
cp -r ./nvim ~/.config/nvim

# ----------------------------------------
# Install Neovim if needed
# ----------------------------------------

echo "Downloading Neovim..."
wget https://github.com/neovim/neovim/releases/download/v0.11.1/nvim-linux-x86_64.tar.gz

echo "Extracting Neovim..."
tar -xvf nvim-linux-x86_64.tar.gz
rm nvim-linux-x86_64.tar.gz

# ----------------------------------------
# Set Neovim as default editor and vim alternative
# ----------------------------------------

echo "Linking nvim to default editor and vim using update-alternatives..."
$SUDO update-alternatives --install /usr/bin/editor editor $(pwd)/nvim-linux-x86_64/bin/nvim 100
$SUDO update-alternatives --install /usr/bin/vim vim $(pwd)/nvim-linux-x86_64/bin/nvim 100

echo "Select default editor manually:"
$SUDO update-alternatives --config editor

echo "Select default vim manually:"
$SUDO update-alternatives --config vim

# ----------------------------------------
# Clone Neovim config (assuming GitHub repo exists)
# ----------------------------------------

# ----------------------------------------
# Install plugins using Lazy.nvim
# ----------------------------------------

echo "Running :Lazy sync to install plugins..."
$(pwd)/nvim-linux-x86_64/bin/nvim --headless -c "Lazy! restore" -c "qa" 
# $(pwd)/nvim-linux-x86_64/bin/nvim --headless -c "+Lazy! sync" +qa 

# ----------------------------------------
# Check and install Node.js >= v20, npm >= v9
# ----------------------------------------

echo "Checking Node.js version..."
if command -v node >/dev/null; then
    node_version=$(node -v | cut -d'v' -f2 | cut -d. -f1)
    if [ "$node_version" -lt 22 ]; then
        echo "Old Node.js detected. Removing..."
        $SUDO apt remove -y nodejs npm
    fi
fi

if ! command -v node >/dev/null || [ "$(node -v | cut -d'v' -f2 | cut -d. -f1)" -lt 22 ]; then
    echo "Installing Node.js v22..."
    curl -fsSL https://deb.nodesource.com/setup_22.x | $SUDO_E bash -
    $SUDO apt install -y nodejs
fi


# Final version check
node_version=$(node -v | cut -d'v' -f2)
npm_version=$(npm -v)

if [[ "$(echo $node_version | cut -d. -f1)" -lt 22 || "$(echo $npm_version | cut -d. -f1)" -lt 9 ]]; then
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
# Install mypy via pip if not installed
# ----------------------------------------

if ! pip show mypy > /dev/null 2>&1; then
    echo "Installing cmakelang via pip..."
    pip install mypy
else
    echo "cmakelang already installed."
fi


# ----------------------------------------
# Install Mason packages in Neovim
# ----------------------------------------

echo "Installing Mason packages in Neovim..."
$(pwd)/nvim-linux-x86_64/bin/nvim --headless -c "MasonInstall lua-language-server bash-language-server cmake-language-server clangd json-lsp pyright" +qa

# echo "Launching Neovim for Copilot authentication..."
# nvim "+Copilot auth" +qa


echo "✅ All setup completed successfully."

