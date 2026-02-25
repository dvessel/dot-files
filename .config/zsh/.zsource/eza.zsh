#!/usr/bin/env zsh

if ! type eza &>/dev/null; then
  path+=/opt/homebrew/opt/eza/bin
fi

export EZA_CONFIG_DIR=$XDG_CONFIG_HOME/eza
