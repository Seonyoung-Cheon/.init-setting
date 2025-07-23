#!/bin/bash

### update package
sudo apt-get update
sudo apt-get -y upgrade

### install zsh
sudo apt-get install -y zsh
sudo apt install -y curl

### zsh setting
cp ~/.init-setting/.zshrc ~/.zshrc
chsh -s /bin/zsh

### tmux conf setting
sudo apt-get install -y tmux
cp ~/.init-setting/.tmux.conf ~/.tmux.conf
tmux source-file ~/.tmux.conf

echo "* Please Re-enter the Shell, then execute zsh-setting.sh"

# Install tmux tpm if it is not installed
if [[ ! -d ~/.tmux/plugins/tpm ]]; then
  echo "Installing tmux tpm..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi




