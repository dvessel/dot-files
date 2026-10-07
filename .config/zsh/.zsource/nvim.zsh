#!/usr/bin/env zsh

if [[ -z $commands[nvim] && -d /opt/homebrew/opt/nvim ]]
then
  path+=/opt/homebrew/opt/nvim/bin
fi
