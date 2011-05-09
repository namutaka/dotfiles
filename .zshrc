#.zshrc

. ~/.profile

PROMPT='%n@%m:[%24<..<%~]%# '

ISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data


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
GAE_JAVA_SDK=~/dev/google/appengine-java-sdk
PATH="$PATH:$GAE_JAVA_SDK/bin"
export APPENGINE_HOME=$GAE_JAVA_SDK

# JAVA
export JAVA_OPTS='-Dgroovy.source.encoding=UTF-8 -Dfile.encoding=UTF-8'
export GROOVY_HOME=/opt/local/share/java/groovy
export _JAVA_OPTIONS='-Dfile.encoding=UTF-8'


# Android
export ANDROID_SDK=~/dev/android/android-sdk-mac_x86
export PATH="$PATH:$ANDROID_SDK/tools:$ANDROID_SDK/platform-tools"


