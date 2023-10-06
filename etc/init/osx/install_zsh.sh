#!/bin/bash

set -e
sudo -k
echo "installing zsh..."

HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask iterm2
HOMEBREW_NO_AUTO_UPDATE=1 brew install zsh

zsh --version

if [ ! -d "$ZSH" ]
then
    echo "installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi


upgrade_oh_my_zsh

echo "installing oh-my-zsh plugins..."
git clone https://github.com/unixorn/git-extra-commands.git $ZSH_CUSTOM/plugins/git-extra-commands