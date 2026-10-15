#!/usr/bin/env zsh

# Make available to x86_64 environment.
if [[ -z $commands[eza] && -d /opt/homebrew/opt/eza ]]
then path+=/opt/homebrew/opt/eza/bin
fi

if (( $+commands[eza] ))
then export EZA_CONFIG_DIR=$XDG_CONFIG_HOME/eza
fi
