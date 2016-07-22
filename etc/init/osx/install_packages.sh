#!/bin/bash

if [[ ! "$(type -P brew)" ]]; then
	echo "Installing Homebrew"
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
if ! brew bundle check; then
	echo "Installing Homebrew missing packages"
	brew bundle	
fi
cd -
