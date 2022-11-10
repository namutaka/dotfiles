# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/Cellar/fzf/0.27.0/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/local/Cellar/fzf/0.27.0/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/Cellar/fzf/0.27.0/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/usr/local/Cellar/fzf/0.27.0/shell/key-bindings.zsh"

# Settings
# ------------
export FZF_DEFAULT_OPTS="--height 40% --border --preview 'head -n10 {}'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

