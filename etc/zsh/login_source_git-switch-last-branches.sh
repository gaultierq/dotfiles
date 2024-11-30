## Add this to your `~/.zshrc` file to have CTRL+G let you select your recent branches
## Open a new terminal, or run `source ~/.zshrc` after adding
## Requires: fzf (`brew install fzf`)
#
# Function to select recent branches
function gsl() {
  git switch -q $( git-recently-checkedout-branches | tac | awk -F'\t' '{print $2}' | fzf +s --tac --preview='git log --oneline {} | head -20')
  zle reset-prompt
}

# Create a ZSH "Widget" and bind to key (CTRL+G here)
zle -N gsl-widget gsl
bindkey '^G' gsl-widget
