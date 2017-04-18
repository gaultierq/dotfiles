#!/bin/zsh -e

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pygmalion"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man colorize github jira vagrant virtualenv pip python brew osx zsh-syntax-highlighting)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
  export VISUAL='vim'
else
  export EDITOR='vim'
  export VISUAL='vim'
fi

if [ -d ~/.zplug ]; then
	export ZPLUG_HOME=~/.zplug
	source $ZPLUG_HOME/init.zsh

	#zplug "b4b4r07/enhancd", use:init.sh

    if ! zplug check --verbose; then
        printf "Install? [y/N]: "
        if read -q; then
            echo; zplug install
        else
            echo
        fi
    fi

	zplug load 
	# zplug check returns true if the given repository exists
	if zplug check b4b4r07/enhancd; then
		# setting if enhancd is available
		export ENHANCD_FILTER=fzf-tmux
	fi
fi

fpath=(/usr/local/share/zsh-completions $fpath)

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# sourcing

#umask 022
#limit coredumpsize 0
#bindkey -d

# # It is necessary for the setting of DOTPATH
# if [[ -f ~/.path ]]; then
#     . ~/.path
# else
#     export DOTPATH="${0:A:t}"
# fi

# # DOTPATH environment variable specifies the location of dotfiles.
# # On Unix, the value is a colon-separated string. On Windows,
# # it is not yet supported.
# # DOTPATH must be set to run make init, make test and shell script library
# # outside the standard dotfiles tree.
# if [[ -z $DOTPATH ]]; then
#     echo "$fg[red]cannot start ZSH, \$DOTPATH not set$reset_color" 1>&2
#     return 1
# fi

# # Vital
# # vital.sh script is most important file in this dotfiles.
# # This is because it is used as installation of dotfiles chiefly and as shell
# # script library vital.sh that provides most basic and important functions.
# # As a matter of fact, vital.sh is a symbolic link to install, and this script
# # change its behavior depending on the way to have been called.
# export VITAL_PATH="$DOTPATH/etc/lib/vital.sh"
# [ -f $VITAL_PATH ] && . "$VITAL_PATH"

[ -f ~/.source_vital ] && . ~/.source_vital

# sourcing my own functions and exports etc.
[ -f "$DOTPATH/etc/lib/login_source.sh" ] && . "$DOTPATH/etc/lib/login_source.sh"

if [ ! -z ${WELCOME_FOLDER+x} ] && [ -d $WELCOME_FOLDER ]; then
	cd $WELCOME_FOLDER 
fi

