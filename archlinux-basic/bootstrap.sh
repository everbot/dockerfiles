#!/bin/bash

cd ~/dev/mylinux/dotfiles
git pull

cd ~/dev/mylinux/.vim
git pull

if [[ $1 == "-d" ]]; then
  while true; do sleep 1000; done
fi

if [[ $1 == "-bash" ]]; then
  /bin/bash
fi

if [[ $1 == "-zsh" ]]; then
  /bin/zsh
fi

