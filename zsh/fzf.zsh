# Setup fzf
# ---------

FZF_SHELL_PATH=/usr/local/opt/fzf/shell

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$FZF_SHELL_PATH/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$FZF_SHELL_PATH/key-bindings.zsh"

# Settings
# ------------
export FZF_DEFAULT_OPTS="--height 40% --border --preview 'head -n10 {}'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

