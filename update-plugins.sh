#!/usr/bin/zsh
rm -rf ~/.config/nvim/lua/plugins
cp -r ./nvim/lua/plugins ~/.config/nvim/lua
# cp ./nvim/lazy-lock.json ~/.config/nvim/lazy-lock.json

echo "Running :Lazy sync to install plugins..."
$(pwd)/nvim-linux-x86_64/bin/nvim --headless -c "Lazy! restore" -c "qa" 

