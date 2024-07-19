#!/bin/bash

### copy vimrc
cp ~/.init-setting/.vimrc ~/.vimrc
cp ~/.init-setting/.vim/syntax ~/.vim/ -r

### vim setting
vim -c 'PlugInstall' -c 'qa!'
export TERM=xterm-256color

### tmux conf setting
cp ~/.init-setting/.tmux.conf ~/.tmux.conf
tmux source-file ~/.tmux.conf

### zsh setting
cp ~/.init-setting/.zshrc ~/.zshrc
cp ~/.init-setting/.p10k.zsh ~/.p10k.zsh
# p10k configure

