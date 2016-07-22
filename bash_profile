#!/bin/bash

source ~/.exports

#homebrew auto completion. TODO: move
PATH=$PATH:/Users/q/Library/Android/sdk/platform-tools
PATH=$PATH:$SCRIPTS
#source `brew --repository`/Library/Contributions/brew_bash_completion.sh

source ~/.aliases
source ~/.functions

# checking last dot files
function update_dotfiles {
	test -d $DOT_FILES && \
	cd $DOT_FILES && \
	log "Updating git references" && git remote update && \
	local n=$(git rev-list HEAD...origin/master --count) && log "local rep is $n behind HEAD" && \
	test $n -gt 0 && log "$n new commits." && git pull && \
	"Re-run config install" && test -f ~/install_config.sh && cat etc/install_dotfiles.sh | bash
	return 0;
}

 if [ -d $DOT_FILES ]; then
 	("update_dotfiles" 1>> $DOT_FILES/install.log &) # parenthesis for quietness
 fi

