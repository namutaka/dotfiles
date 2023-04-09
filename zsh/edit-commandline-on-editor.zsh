# Enable editing command line on editor

autoload -U edit-command-line
zle -N edit-command-line

# emacsモードで <C-x>e
bindkey '^xe' edit-command-line

# vimモードで v
# 不要
# bindkey -M vicmd v edit-command-line


