#!/usr/bin/zsh
cp -r ./nvim/lua/plugins ~/.config/nvim/lua

echo "Running :Lazy sync to install plugins..."
$(pwd)/nvim-linux-x86_64/bin/nvim --headless -c "Lazy! sync" -c "qa" 


