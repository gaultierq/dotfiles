#!/bin/bash

xcode-select --install 2>&1 >> /dev/null

set -e

if [[ ! "$(type -P brew)" ]]; then

	echo "Installing Homebrew"
	sudo -v
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	sudo -k

	brew update && brew upgrade
fi



cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
if ! HOMEBREW_NO_AUTO_UPDATE=1 brew bundle --file essentials.Brewfile check; then
	echo "Installing Homebrew missing packages"
	HOMEBREW_NO_AUTO_UPDATE=1 brew bundle	--file essentials.Brewfile
fi
cd -
