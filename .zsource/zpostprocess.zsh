#!/usr/bin/env zsh

# Tell `p10k configure` which file it should overwrite.
typeset -g POWERLEVEL9K_CONFIG_FILE=$HOME/.zsource/p10k.zsh

if ! type compinit >/dev/null; then
  # Normally handled by antidote plugin:
  # @see ~/.zplugins - mattmc3/ez-compinit
  autoload -Uz compinit; compinit -d $XDG_CACHE_HOME/zsh/zcompdump
fi
