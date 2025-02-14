#!/usr/bin/env zsh

if type conda &>/dev/null; then
  eval "$(conda shell.$SHELL:t hook 2> /dev/null)"
fi
