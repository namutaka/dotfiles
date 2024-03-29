# .alias

alias ls='ls -GF'
alias ll='ls -l'
alias la='ls -la'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias diff='diff -u'

alias now='date +%Y%m%d_%H%M%S'
alias today='date +%Y%m%d'

if [ -f /Applications/MacVim.app/Contents/MacOS/Vim ]; then
  alias vi=/Applications/MacVim.app/Contents/MacOS/Vim
  alias vim=vi
fi

# git series
alias gst='git st'
alias gl='git log --graph --decorate'
alias gf='git flow'
alias gff='git flow feature'
alias gfh='git flow hotfix'
alias gfr='git flow release'
alias gb='git br'
alias gsl='gst;echo;gl -3'
alias gg='open -a SourceTree.app $(git rev-parse --show-toplevel)'
alias gk='gitk --all &'

alias cdr='cd $(git rev-parse --show-toplevel)'

# mac
alias ql='qlmanage -p "$@" >& /dev/null'

