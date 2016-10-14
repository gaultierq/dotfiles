#!/bin/bash
BREWFILE="$DOTPATH/etc/init/osx/Brewfile"
brew bundle dump --file=$BREWFILE --force
git add $BREWFILE
