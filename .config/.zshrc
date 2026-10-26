#!/usr/bin/env zsh

# Load order of dotfiles:
# 1. ~/.zshenv
# 2. ~/.config/.zprofile
# 3. ~/.config/.zshrc <-
# 4. ~/.config/.zlogin

# Autoloading zfunctions and zcompletions.
export ZFUNCDIR=${ZFUNCDIR:-$HOME/.local/zfunctions}

# Add local paths, keep [-U]nique.
typeset -gU  path=( ~/.local/{bin,zbin} $path )
typeset -gU fpath=( $ZFUNCDIR $fpath /{usr/local,opt/homebrew}/share/zsh/site-functions(N) )

# Autoload zfunctions from $ZFUNCDIR.
autoload -Uz $ZFUNCDIR/[^_]*(N.:t) &>/dev/null

# Shell integrations and aggregated zsource/*.zsh. Maintain order for set names.
acsource zsh-aggregate \
  /opt/homebrew/opt/fzf/shell/{key-bindings,completion}.zsh(N) \
  $ZDOTDIR/zsource/{options,p10k-config,antidote,*}.zsh

# Normally handled by antidote zplugins->mattmc3/ez-compinit
if ! (( $+functions[compinit] ))
then
  autoload -Uz compinit
  compinit -d $XDG_CACHE_HOME/zsh/zcompdump
fi
