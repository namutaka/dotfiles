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
EOS)

DOTFILES=${0%/*}

for file in $FILES; do
  ln -s $DOTFILES/$file .$file
done

