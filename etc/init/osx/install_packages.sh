#!/bin/bash

if [[ ! "$(type -P brew)" ]]; then
	echo "Installing Homebrew"
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Installing Homebrew packages"
PWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $PWD
brew bundle
cd -