#!/usr/bin/env zsh

# Plug-in options. @see ~/.zplugins

# - mattmc3/ez-compinit
zstyle ':plugin:ez-compinit' 'compstyle' 'zshzoo'
zstyle ':plugin:ez-compinit' 'use-cache' 'yes'

# - mattmc3/zephyr plugins:zfunctions
export ZFUNCDIR=~/.local/zfunctions

# - dvessel/zsh-completion-generator
export GENCOMPL_FPATH=~/.local/zfunctions

# Lazy-load antidote from its functions directory.
fpath=( `brew --prefix antidote`/share/antidote/functions $fpath)
autoload -Uz antidote

if type antidote &>/dev/null; then

  zplugins=~/.zplugins
  zpstatic=~/.zsource/zplugins!zsh

  export ANTIDOTE_HOME=~/.cache/antidote
  zstyle ':antidote:bundle' use-friendly-names 'yes'
  zstyle ':antidote:bundle' file $zplugins
  zstyle ':antidote:static' file $zpstatic
  zstyle ':antidote:*' zcompile 'yes'

  if [[ ! $zpstatic -nt $zplugins ]]; then
    # Generate new static file when zplugins is updated.
    antidote load
  else
    # Manually source when antidote doesn't need to load.
    source $zpstatic
  fi
else
  # Normally handled by antidote plugin:
  # - mattmc3/ez-compinit
  autoload -Uz compinit && compinit
fi
