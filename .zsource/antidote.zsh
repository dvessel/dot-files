#!/usr/bin/env zsh

if test -d $HOMEBREW_PREFIX/opt/antidote; then
  # Lazy-load antidote from its functions directory.
  fpath+=$HOMEBREW_PREFIX/opt/antidote/share/antidote/functions
  autoload -Uz antidote

  # Plug-in options. @see ~/.zplugins

  # - mattmc3/ez-compinit
  zstyle ':plugin:ez-compinit' 'compstyle' 'zshzoo'
  zstyle ':plugin:ez-compinit' 'use-cache' 'yes'

  # - dvessel/zsh-completion-generator
  export GENCOMPL_FPATH=$ZFUNCDIR

  # - jeffreytse/zsh-vi-mode
  function zvm_after_init() {
    # Unbind the default forward search.
    bindkey -r -M viins '^S'
    # Restore Aloxaf/fzf-tab history search.
    zvm_bindkey viins '^R' fzf-history-widget
    zvm_bindkey vicmd '/' history-incremental-pattern-search-backward
    zvm_bindkey vicmd '?' history-incremental-pattern-search-forward
    # Active ctrl-[r|s] in interactive search mode triggered by vicmd search.
    zvm_bindkey isearch '^R' history-incremental-pattern-search-backward
    zvm_bindkey isearch '^S' history-incremental-pattern-search-forward
  }

  # Core plug-in options. @see man antidote
  local zplugins=$HOME/.zplugins
  local zpstatic=$XDG_CACHE_HOME/zsh/zplugins.zsh

  export ANTIDOTE_HOME=$XDG_CACHE_HOME/antidote
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
