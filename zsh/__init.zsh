#
# zsh base settings
#

# shellのキー操作をemacs操作にする
bindkey -e

# pager
PAGER=

# history settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data


# 補完を有効化
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
autoload -U compinit
compinit


# `cd -<TAB>` でcd履歴を補完
setopt autopushd


# LS
export LSCOLORS=cxfxcxdxbxegedabagacad

# path
export PATH="$HOME/dotfiles/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/local/bin:$PATH"

# load localrc
[ -r ~/.localrc ] && . ~/.localrc

