#!/bin/bash

### update package
sudo apt-get update
sudo apt-get -y upgrade

### install zsh
sudo apt-get install -y zsh
sudo apt install -y curl
sudo apt install ripgrep
sudo apt install unzip

### tmux conf setting
sudo apt-get install -y tmux
cp ~/.init-setting/.tmux.conf ~/.tmux.conf
tmux source-file ~/.tmux.conf

# Install tmux tpm if it is not installed
if [[ ! -d ~/.tmux/plugins/tpm ]]; then
  echo "Installing tmux tpm..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

chsh -s /usr/bin/zsh

### zsh setting
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"



