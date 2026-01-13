#!/bin/bash

if [ "$(id -u)" -eq 0 ]; then
  SUDO=""
else
  SUDO="sudo"
fi

### update package
$SUDO apt-get update
$SUDO apt-get -y upgrade

### install zsh
$SUDO apt-get install -y zsh
$SUDO apt install -y curl
$SUDO apt install -y wget 
$SUDO apt install -y clangd
$SUDO apt install ripgrep
$SUDO apt install unzip

### tmux conf setting
$SUDO apt-get install -y tmux
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



