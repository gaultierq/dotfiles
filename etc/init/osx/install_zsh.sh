#!/bin/bash

set -e
sudo -k

HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask iterm2
HOMEBREW_NO_AUTO_UPDATE=1 brew install zsh
# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
zsh --version
upgrade_oh_my_zsh

git clone https://github.com/unixorn/git-extra-commands.git $ZSH_CUSTOM/plugins/git-extra-commands