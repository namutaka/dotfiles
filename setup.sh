#!/bin/bash
# Run in user root directory
#
set -e

SCRIPT_DIR=$(cd $(dirname $0); pwd)
CONFIG_DIR=$SCRIPT_DIR/config

cd ~/

FILES=(
  zshrc
  vim
  tmux.conf
  sshrc
  sshrc.d
)

for file in ${FILES[@]}; do
  target=~/.$file
  if [ -e $target ]; then
    echo "skipping $target"
  else
    echo ln -s $SCRIPT_DIR/$file $target
    ln -s $SCRIPT_DIR/$file $target
  fi
done

for config_path in $(cd $CONFIG_DIR; ls); do
  target=~/.config/$config_path
  if [ -e $target ]; then
    echo "skipping $target"
  else
    echo ln -s $CONFIG_DIR/$config_path $target
    ln -s $CONFIG_DIR/$config_path $target
  fi
done

