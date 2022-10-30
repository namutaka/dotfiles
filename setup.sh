#!/bin/bash
# Run in user root directory
#
set -ex

SCRIPT_DIR=$(cd $(dirname $0); pwd)

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
  config/nvim
  config/goneovim
)

for file in ${FILES[@]}; do
  target=~/.$file
  if [ -e $target ]; then
    echo "skipping $target"
  else
    ln -s $SCRIPT_DIR/$file $target
  fi
done

