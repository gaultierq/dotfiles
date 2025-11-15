# LazyGit on Ctrl+Z
lazygit-widget() {
  lazygit
}
zle -N lazygit-widget
bindkey '^Z' lazygit-widget

# Autojump + fzf on Ctrl+F
function _autojump() {
  local dir
  dir=$(sort -nr /Users/q/Library/autojump/autojump.txt | awk '{print $2}' | head -n 10 | tac | fzf +s --tac)
  if [[ -n "$dir" ]]; then
    BUFFER="cd ${(q)dir}"
    zle accept-line
  fi
}

zle -N autojump-widget _autojump
bindkey '^F' autojump-widget



function open-current-dir-editor() {
  if [[ -n "$EDITOR" ]]; then
    "$EDITOR" .
  else
    echo "\$EDITOR is not set"
  fi
  zle reset-prompt
}

zle -N open-current-dir-editor
bindkey '^O' open-current-dir-editor

# defined in kubectl-config-switcher/kubectl-config-switcher.plugin.zsh
zle -N kcs-widget kcs
bindkey '^K' kcs-widget

#
# # Function to select recent branches
function gsl() {
  git switch -q $( git-recently-checkedout-branches | tac | awk -F'\t' '{print $2}' | fzf +s --tac --preview='git log --oneline {} | head -20')
  zle reset-prompt
}

# Function to select and navigate to git worktree
function gwt() {
  local worktree
  worktree=$(git worktree list | awk '{print $1}' | fzf +s --preview='git -C {} log --oneline | head -20')
  if [[ -n "$worktree" ]]; then
    cd "$worktree"
    zle reset-prompt
  fi
}

## Actual widget logic
# Display Git Prefix help
function git-prefix-mode() {
  local saved_buffer=$BUFFER
  local saved_cursor=$CURSOR

  # Display help message
  echo -n "\r[Git Mode] Press 'b' for branch switcher, 'w' for worktree"
  read -k key
  echo -n "\r\033[K"  # Clear the message

  case "$key" in
    b)
      zle gsl-widget
      ;;
    w)
      zle gwt-widget
      ;;
  esac

  # Restore the prompt and buffer
  BUFFER=$saved_buffer
  CURSOR=$saved_cursor
  zle reset-prompt
}

# Register widget
zle -N gsl-widget gsl
zle -N gwt-widget gwt
zle -N git-prefix-mode
bindkey '^G' git-prefix-mode


# Open bindings
open_my_bindings() {
  nvim "$HOME/dotfiles/etc/zsh/login_source_my_bindings.sh"
}

# Register it as a ZLE widget
zle -N open_my_bindings

# Bind Ctrl+B to it
bindkey '^b' open_my_bindings


# Open bindings
open_my_todo() {
  nvim "$HOME/Desktop/todo.txt"
}

# Register it as a ZLE widget
zle -N open_my_todo

# Bind Ctrl+B to it
bindkey '^x' open_my_todo


