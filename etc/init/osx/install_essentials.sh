#!/bin/bash

set -e

xcode-select --install

sudo -v


if [[ ! "$(type -P brew)" ]]; then
	echo "Installing Homebrew"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "brew update and upgrade..."
brew update && brew upgrade

cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
if ! brew bundle check; then
	echo "Installing Homebrew missing packages"
	brew bundle	
fi
cd -

sudo -k