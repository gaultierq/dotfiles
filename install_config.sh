sudo -v

export DOT_FILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


echo "Symlink all dot files"
env RCRC=$DOT_FILES/rcrc rcup -v

source ~/.bash_profile

$DOT_FILES/homebrew/install.sh

$DOT_FILES/osx_setup.sh

$DOT_FILES/other_setups.sh