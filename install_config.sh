#!/bin/bash
sudo -v
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

printf "Checking dependencies..."
hash rcup > /dev/null 2>&1 || echo "Please install RCM util: https://github.com/thoughtbot/rcm";
echo " ok"
echo "Symlink all dot files"
env RCRC=$DIR/rcrc rcup -v

test -f ~/.bash_profile && source ~/.bash_profile


#$DOT_FILES/homebrew/install.sh

#$DOT_FILES/osx_setup.sh

#$DOT_FILES/other_setups.sh
