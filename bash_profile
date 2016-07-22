#!/bin/bash

source ~/.exports

#homebrew auto completion. TODO: move
PATH=$PATH:/Users/q/Library/Android/sdk/platform-tools
PATH=$PATH:$SCRIPTS
#source `brew --repository`/Library/Contributions/brew_bash_completion.sh

source ~/.aliases
source ~/.functions

# Auto update
function update_dotfiles {
	set -e
	if [ -d $DOT_FILES ]; then
		cd $DOT_FILES
		log "Updating git references" 
		git remote update
		local n=$(git rev-list HEAD...origin/master --count)
		log "local rep is $n behind HEAD"

		if test $n -gt 0; then
			log "$n new commits."
			git pull
			echo "Re-run config install" 
			if [ -f ~/install_config.sh ]; then
				cat etc/install_dotfiles.sh | bash
			else
				log "install_dotfiles.sh not found"
			fi
		fi 
		
	fi
}

 if [ -d $DOT_FILES ]; then
 	("update_dotfiles" 1>> $DOT_FILES/install.log &) # parenthesis for quietness
 fi

