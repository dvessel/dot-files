#!/usr/bin/env zsh

if source `brew --prefix antidote`/share/antidote/antidote.zsh &>/dev/null; then
  # Plug-in options. @see .zsh_plugins

  # - mattmc3/ez-compinit
  zstyle ':plugin:ez-compinit' 'compstyle' 'zshzoo'
  zstyle ':plugin:ez-compinit' 'use-cache' 'yes'

  # - mattmc3/zephyr plugins:zfunctions
  export ZFUNCDIR=~/.local/zfunctions

  # - dvessel/zsh-completion-generator
  export GENCOMPL_FPATH=~/.local/zfunctions

  export ANTIDOTE_HOME=~/.cache/antidote
  zstyle ':antidote:bundle' use-friendly-names 'yes'
  zstyle ':antidote:bundle' file ~/.zplugins
  zstyle ':antidote:static' file ~/.zsource/zplugins!zsh
  zstyle ':antidote:*' zcompile 'yes'

  antidote load
else
  # Normally handled by antidote plugin:
  # - mattmc3/ez-compinit
  autoload -Uz compinit && compinit
fi
