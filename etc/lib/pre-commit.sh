#!/bin/bash
BREWFILE="$DOTPATH/etc/init/osx/Brewfile"
brew bundle dump --file-path=$BREWFILE --force
git add $BREWFILE
