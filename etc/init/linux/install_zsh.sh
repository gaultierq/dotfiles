#!/bin/bash -e

echo "Installing zsh"
sudo apt-get -y --force-yes install zsh
sudo chsh -s "$(command -v zsh)" "${USER}"


echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


echo "Installing zplug"
if [ ! -d ~/.zplug ]; then
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi