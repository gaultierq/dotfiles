#!/bin/bash



xcode-select --install >> /dev/null

set -e

sudo -v


if [[ ! "$(type -P brew)" ]]; then
	echo "Installing Homebrew"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

sudo -k

echo "brew update and upgrade..."
brew update && brew upgrade

cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
if ! brew bundle check; then
	echo "Installing Homebrew missing packages"
	brew bundle	
fi
cd -

