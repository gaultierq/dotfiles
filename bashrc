#!/bin/sh -e

# It is necessary for the setting of DOTPATH
[ -f ~/.path ] && . ~/.path

# DOTPATH environment variable specifies the location of dotfiles.
# On Unix, the value is a colon-separated string. On Windows,
# it is not yet supported.
# DOTPATH must be set to run make init, make test and shell script library
# outside the standard dotfiles tree.
if [ -z "$DOTPATH" ]; then
    echo "cannot start $SHELL, \$DOTPATH not set" 1>&2
    return 1
fi

# Load vital library that is most important and
# constructed with many minimal functions
# For more information, see etc/README.md
. "$DOTPATH"/etc/lib/vital.sh
if ! vitalize 2>/dev/null; then
    echo "cannot vitalize, cannot start $SHELL" 1>&2
    return 1
fi




#source ~/.exports

#TODO: move to 'local'
#PATH=$PATH:/Users/q/Library/Android/sdk/platform-tools
#PATH=$PATH:$SCRIPTS

#homebrew auto completion. TODO: move
#source `brew --repository`/Library/Contributions/brew_bash_completion.sh




# Auto update
# function update_dotfiles {
# 	set -e
# 	if [ -d $DOT_FILES ]; then
# 		cd $DOT_FILES
# 		log "Updating git references" 
# 		git remote update
# 		local n=$(git rev-list HEAD...origin/master --count)
# 		log "local rep is $n behind HEAD"

# 		if test $n -gt 0; then
# 			log "$n new commits."
# 			git pull
# 			echo "Re-run config install" 
# 			if [ -f $DOT_FILES/etc/install_dotfiles.sh ]; then
# 				# perform the install
# 				cat $DOT_FILES/etc/install_dotfiles.sh | bash
# 			else
# 				log "install_dotfiles.sh not found"
# 			fi
# 		else
# 			log "Repository up to date. Not re-installing."
# 		fi 
# 	fi
# }

#  if [ -d $DOT_FILES ]; then
#  	# ("update_dotfiles" 1>> $DOT_FILES/install.log &) # parenthesis for quietness
#  	update_dotfiles
#  fi

