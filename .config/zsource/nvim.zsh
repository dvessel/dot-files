#!/usr/bin/env zsh

# Make available to x86_64 environment.
if [[ -z $commands[nvim] && -d /opt/homebrew/opt/nvim ]]
then path+=/opt/homebrew/opt/nvim/bin
fi
