#!/bin/bash

set -e

if [[ ! "$(type -P brew)" ]]; then

	echo "Installing Homebrew"
	sudo -v
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	sudo -k
fi

echo "brew update and upgrade..."
brew update && brew upgrade

cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
if ! brew bundle check; then
	echo "Installing Homebrew missing packages"
	brew bundle	
fi
cd -

