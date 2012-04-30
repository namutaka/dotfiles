#.zshrc

[ -r ~/.profile ] && . ~/.profile
[ -r ~/.alias ] && . ~/.alias

PROMPT='[%24<..<%~]%# '
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

#mvim
function mvi() {
  if [ $# != 0 ]; then
    mvim --remote-tab-silent $@ 2> /dev/null
  else
    srvs=`mvim --serverlist 2> /dev/null`
    if [ "$srvs" != "" ]; then
      mvim --remote-send ":tabnew<CR>"
    else
      mvim
    fi
  fi
}


# Load RVM function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

