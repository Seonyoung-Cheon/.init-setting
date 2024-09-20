#!/bin/bash

### copy vimrc
cp ~/.init-setting/.vimrc ~/.vimrc
cp ~/.init-setting/.vim/syntax ~/.vim/ -r

### vim setting
git clone https://github.com/morhetz/gruvbox.git ~/.vim/plugged/gruvbox
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim -c 'PlugInstall' -c 'qa!'
export TERM=xterm-256color
cd ~/.vim/plugged/YouCompleteMe
python3 install.py --clangd-completer
cd ~

export TERM=xterm-256color
