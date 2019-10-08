#!/bin/bash
set -e

FILES=(
  zsh
  zshrc
  vim
  vimrc
  gvimrc
  gitconfig
  screenrc
  vrapperrc
  tmux.conf
  sshrc
  sshrc.d
)

DOTFILES=${0%/*}

for file in ${FILES[@]}; do
  target=.$file
  if [ -e $target ]; then
    echo "skipping $target"
  else
    echo ln -s $DOTFILES/$file $target
  fi
done

