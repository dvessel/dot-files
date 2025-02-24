#!/usr/bin/env zsh

if test -d $HOMEBREW_PREFIX/opt/antidote; then
  # Lazy-load antidote from its functions directory.
  fpath+=$HOMEBREW_PREFIX/opt/antidote/share/antidote/functions
  autoload -Uz antidote

  # Plug-in options. @see ~/.zplugins

  # - mattmc3/ez-compinit
  zstyle ':plugin:ez-compinit' 'compstyle' 'zshzoo'
  zstyle ':plugin:ez-compinit' 'use-cache' 'yes'

  # - mattmc3/zephyr plugins:zfunctions
  export ZFUNCDIR=~/.local/zfunctions

  # - dvessel/zsh-completion-generator
  export GENCOMPL_FPATH=~/.local/zfunctions

  # - jeffreytse/zsh-vi-mode
  function zvm_after_init() {
    zvm_bindkey vicmd '/' history-incremental-pattern-search-backward
    zvm_bindkey vicmd '?' history-incremental-pattern-search-forward
    zvm_bindkey viins '^R' history-incremental-pattern-search-backward
    zvm_bindkey viins '^S' history-incremental-pattern-search-forward
  }

  # Core plug-in options. @see man antidote
  local zplugins=~/.zplugins
  local zpstatic=${XDG_CACHE_HOME:-~/.cache}/zsh/zplugins.zsh

  export ANTIDOTE_HOME=${XDG_CACHE_HOME:-~/.cache}/antidote
  zstyle ':antidote:bundle' use-friendly-names 'yes'
  zstyle ':antidote:bundle' file $zplugins
  zstyle ':antidote:static' file $zpstatic
  zstyle ':antidote:*' zcompile 'yes'

  test -f $zplugins || touch $zplugins

  if test ! $zpstatic -nt $zplugins; then
    # Generate new static file when zplugins is updated.
    mkdir -p $zpstatic:h
    antidote load
  else
    # Manually source when antidote doesn't need to load.
    source $zpstatic
  fi
fi
