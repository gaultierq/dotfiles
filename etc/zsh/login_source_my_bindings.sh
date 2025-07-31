lazygit-widget() {
  lazygit
}

zle -N lazygit-widget
bindkey '^Z' lazygit-widget

#  -----
function _autojump() {
  cd $(sort -nr /Users/q/Library/autojump/autojump.txt | awk '{print $2}' | head -n 10 | tac | fzf +s --tac)
  # git switch -q $( git-recently-checkedout-branches | tac | awk -F'\t' '{print $2}' | fzf +s --tac --preview='git log --oneline {} | head -20')
  zle reset-prompt
}

# Create a ZSH "Widget" and bind to key (CTRL+G here)
zle -N autojump-widget _autojump
bindkey '^F' autojump-widget
