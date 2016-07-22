#!/bin/bash

set -e

PWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function install {
	printf "Checking dependencies..."
	hash rcup > /dev/null 2>&1 || echo "Please install RCM util: https://github.com/thoughtbot/rcm";
	echo "ok. Symlink all dot files"
	env RCRC=$PWD/rcrc rcup -v
	test -f ~/.bash_profile && source ~/.bash_profile
}

function update {
	test -d $DOT_FILES && \
	cd $DOT_FILES && \
	log "Updating git references" && git remote update && \
	local n=$(git rev-list HEAD...origin/master --count) && log "local rep is $n behind HEAD" && \
	test $n -gt 0 && log "$n new commits." && git pull && \
	"Re-run config install" && test -f ~/install_config.sh && bash install_config.sh;
	return 0;
}

function uninstall {
	#TODO
}