#!/usr/bin/env zsh

if [[ -z $commands[eza] && -d /opt/homebrew/opt/eza ]]
then
  path+=/opt/homebrew/opt/eza/bin
fi

export EZA_CONFIG_DIR=$XDG_CONFIG_HOME/eza
