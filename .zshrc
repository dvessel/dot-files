#!/usr/bin/env zsh

# Powerlevel10k instant prompt.
test ! -f ~/.cache/p10k-instant-prompt-${(%):-%n}.zsh \
|| source ~/.cache/p10k-instant-prompt-${(%):-%n}.zsh

# Add local paths and prevent duplicates.
typeset -aU  path=(~/.local/{bin,zbin} $path)
typeset -aU fpath=(/{opt/homebrew,usr/local}/share/zsh/site-functions $fpath)

# Source ~/.zsorce/*.zsh while maintaining order for the set names.
typeset -aU zsource=( ~/.zsource/{options,p10k,antidote,*}.zsh )
source <(cat $zsource)
unset zsource
