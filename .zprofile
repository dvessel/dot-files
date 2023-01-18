#!/usr/bin/env zsh

if [[ `/usr/sbin/sysctl -n sysctl.proc_translated` == 1 ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
else
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
