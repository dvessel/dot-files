#!/usr/bin/env zsh

if [[ -z $commands[bat] && -d /opt/homebrew/opt/bat ]]
then
  path+=/opt/homebrew/opt/bat/bin
fi
