#!/bin/bash

source ~/.exports

#homebrew auto completion. TODO: move
PATH=$PATH:/Users/q/Library/Android/sdk/platform-tools
PATH=$PATH:$SCRIPTS
#source `brew --repository`/Library/Contributions/brew_bash_completion.sh


source ~/.aliases
source ~/.functions

# checking last dot files
update_dotfiles() {
	test -d $DOT_FILES && \
	cd $DOT_FILES && \
	n=$(git rev-list HEAD...origin/master --count) && \
	test $n -gt 0 && echo "$n new commits." && \ 
	git pull 
}
"update_dotfiles" > /dev/null 2>&1 &

