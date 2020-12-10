#!/bin/bash

xcode-select --install >> /dev/null

set -e

if [[ ! "$(type -P brew)" ]]; then

	echo "Installing Homebrew"
	sudo -v
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	sudo -k
fi

HOMEBREW_NO_AUTO_UPDATE=1 brew install git curl htop tree rsync unzip wget
