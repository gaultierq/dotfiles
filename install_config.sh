sudo -v

echo "Checking dependencies"
hash rcup > /dev/null 2>&1 || echo "Please install RCM util: https://github.com/thoughtbot/rcm"; exit 1

echo "Symlink all dot files"
env RCRC=$DOT_FILES/rcrc rcup -v

source ~/.bash_profile


#$DOT_FILES/homebrew/install.sh

#$DOT_FILES/osx_setup.sh

#$DOT_FILES/other_setups.sh
