#!/bin/bash
set -e

FILES=$(cat <<EOS
  zsh
  zshrc
  vim
  vimrc
  gvimrc
  gitconfig
  screenrc
  vrapperrc
  tmux.conf
EOS)

DOTFILES=${0%/*}

for file in $FILES; do
  target=.$file
  if [ -e $target ]; then
    echo "skipping $target"
  else
    ln -s $DOTFILES/$file $target
  fi
done

