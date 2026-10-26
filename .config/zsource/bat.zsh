#!/usr/bin/env zsh

# Make available to x86_64 environment.
if [[ -z $commands[bat] && -d /opt/homebrew/opt/bat ]]
then path+=/opt/homebrew/opt/bat/bin
fi
