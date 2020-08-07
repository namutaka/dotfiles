#!/bin/bash
# Run in user root directory
#
set -ex

cd ~/

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
  irbrc
  irb
)

DOTFILES=${0%/*}

for file in ${FILES[@]}; do
  target=.$file
  if [ -e $target ]; then
    echo "skipping $target"
  else
    ln -s $DOTFILES/$file $target
  fi
done

