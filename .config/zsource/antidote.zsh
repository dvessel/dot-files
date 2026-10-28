#!/usr/bin/env zsh

if [[ -d /opt/homebrew/opt/antidote ]]
then
  # Lazy-load antidote from its functions directory.
  fpath+=/opt/homebrew/opt/antidote/share/antidote/functions
  autoload -Uz antidote

  # Core plug-in options. @see man antidote
  export ANTIDOTE_HOME=$XDG_DATA_HOME/antidote
  zstyle ':antidote:snapshot' dir $ANTIDOTE_HOME/snapshots
  zstyle ':antidote:snapshot' max 50
  local zplugins=$ZDOTDIR/zplugins
  local zpstatic=$XDG_CACHE_HOME/zsh/zplugins.zsh
  zstyle ':antidote:bundle' path-style short
  zstyle ':antidote:bundle' file $zplugins
  zstyle ':antidote:static' file $zpstatic
  zstyle ':antidote:*' zcompile yes

  antidote load
fi
