#.zshrc

. ~/.profile

PROMPT='%n@%m:[%24<..<%~]%# '

# my aliases
alias ls='ls -F'
alias ll='ls -l'
alias la='ls -la'

alias rm='rm -i'
alias cp='cp -i'


# Google App Engine SDK for JAVA
GAE_JAVA_SDK=/Users/namu/dev/appengine-java-sdk
PATH="$PATH:$GAE_JAVA_SDK/bin"

# JAVA
export _JAVA_OPTIONS="-Dfile.encoding=UTF-8"

