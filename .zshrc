#.zshrc

. ~/.profile

PROMPT='%n@%m:[%24<..<%~]%# '

# my aliases
export LSCOLORS=cxfxcxdxbxegedabagacad
alias ls='ls -GF'
alias ll='ls -l'
alias la='ls -la'

alias rm='rm -i'
alias cp='cp -i'

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


# Google App Engine SDK for JAVA
GAE_JAVA_SDK=/Users/namu/dev/appengine-java-sdk
PATH="$PATH:$GAE_JAVA_SDK/bin"

# JAVA
export JAVA_OPTS="-Dfile.encoding=UTF-8"

