#homebrew auto completion
source `brew --repository`/Library/Contributions/brew_bash_completion.sh
# alias echourl="wget -qO -"

#svn
#export SVN_EDITOR=nano
alias src='source ~/.bash_profile'

alias copy_pub="cat ~/.ssh/id_dsa.pub | pbcopy"


# misc
alias slowconn='sudo ipfw pipe 1 config bw 20kbit/s plr 0.3 delay 1000ms; sudo ipfw add pipe 1 dst-port http;'
alias goodconn='sudo ipfw flush'

# find
function f() {
	find . -type f -print0 | xargs -0 grep -i $1;
}
alias f=f

# find file
function ff() {
	list=$(find . -name "*$1*");
	n=$(echo "$list" | wc -l);
	printf "$n results found: \n$list\n"
	if [ $n -eq 1 ]; then
		sb $list
	fi
}
alias ff=ff


alias memusage='ps -amcwwwxo "command %mem %cpu" | grep -v grep | head -10'
