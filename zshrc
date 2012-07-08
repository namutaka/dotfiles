#.zshrc

PROMPT='[%24<..<%~]%# '
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

DOTFILES_PATH=~/DotFiles
for shfile in $DOTFILES_PATH/zsh/*.*sh; do
  [ -r $shfile ] && . $shfile
done

for incfile in $DOTFILES_PATH/include/*.inc; do
  [ -r $incfile ] && . $incfile
done

[ -r ~/.localrc ] && . ~/.localrc
