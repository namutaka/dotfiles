#!/bin/bash
# Link dotfiles/directories
#
set -e

SCRIPT_DIR=$(cd $(dirname $0); pwd)

linkToDot() {
  local target=$1

  if [[ -z $target ]]; then
    echo "Error target is required" >&2
    exit 1
  fi

  local dest_path=~/.$target
  local src_path=$SCRIPT_DIR/$target

  if [[ -e $dest_path ]]; then
    echo "Already exists $dest_path : $src_path"
  else
    echo ln -s $src_path $dest_path
    ln -s $src_path $dest_path
  fi
}

cd ~/

linkToDot zshrc
linkToDot vim
linkToDot sshrc
linkToDot sshrc.d

for config_path in $(cd $SCRIPT_DIR; ls -d config/*); do
  linkToDot $config_path
done

