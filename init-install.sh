#!/bin/bash

### vim setting
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone https://github.com/morhetz/gruvbox.git ~/.vim/plugged/gruvbox
vim -c 'PlugInstall' -c 'qa!'
export TERM=xterm-256color
cd ~/.vim/plugged/YouCompleteMe
python3 install.py --clangd-completer
cd ~

### tmux conf setting
# Install tmux tpm if it is not installed
if [[ ! -d ~/.tmux/plugins/tpm ]]; then
  echo "Installing tmux tpm..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

tmux source-file ~/.tmux.conf

### zsh setting
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s /bin/zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/wting/autojump.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/autojump
cd ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/autojump
python3 ./install.py
cd ~

exec zsh
source $ZSH/oh-my-zsh.sh
source ~/.zshrc
p10k configure

