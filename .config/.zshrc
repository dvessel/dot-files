#!/usr/bin/env zsh

# Load order of dotfiles:
# 1. ~/.zshenv
# 2. ~/.config/.zshrc <-
# 3. ~/.config/.zlogin

# Create XDG directories.
() {
  while (( $+1 )) { mkdir -p ${(P)1}; shift }
} XDG_{CONFIG,CACHE,DATA,STATE}_HOME

# Powerlevel10k instant prompt.
[[ -f $XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh ]] &&
    . $XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh

# Homebrew options.
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_AUTO_UPDATE_SECS=3600

# Contains functions and completions.
export ZFUNCDIR=${ZFUNCDIR:-$HOME/.local/zfunctions}
# Autoload functions.
autoload -Uz $ZFUNCDIR/[^_]*(:t.N) &>/dev/null

# Add local paths, keep [-U]nique.
typeset -gU  path=( ~/.local/{bin,zbin} $path )
typeset -gU fpath=( $ZFUNCDIR $fpath )

# Initialize Homebrew.
#   0) Native ARM.
#   1) Translated x86.
case $( sysctl -n sysctl.proc_translated ) in
  0) eval "$( /opt/homebrew/bin/brew shellenv )"  ;;
  1) eval "$( /usr/local/bin/brew shellenv )"     ;;
esac

# Shell integrations and aggregated zsource/*.zsh. Maintain order for set names.
acsource zsh-aggregate \
  /opt/homebrew/opt/fzf/shell/{key-bindings,completion}.zsh(N) \
  $ZDOTDIR/zsource/{options,zplugins-options,antidote,*}.zsh

# Normally handled by antidote zplugins->mattmc3/ez-compinit
if ! (( $+functions[compinit] ))
then
  autoload -Uz compinit
  compinit -d $XDG_CACHE_HOME/zsh/zcompdump
fi
