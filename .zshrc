#!/usr/bin/env zsh

# Powerlevel10k instant prompt.
test ! -f ~/.cache/p10k-instant-prompt-${(%):-%n}.zsh \
|| source ~/.cache/p10k-instant-prompt-${(%):-%n}.zsh

# Add local paths and prevent duplicates.
typeset -aU  path=(~/.local/{bin,zbin} $path)
typeset -aU fpath=(/{opt/homebrew,usr/local}/share/zsh/site-functions $fpath)

typeset -aU zsources
# Collect ~/.zsource/*.zsh while maintaining order for set names.
zsources=( ~/.zsource/{options,p10k,antidote,*}.zsh )
combined=~/.zsource/zsource!zsh
for zsh in $zsources; if [[ ! $combined -nt $zsh ]]; then
  cat $zsources > $combined
  zcompile $combined
  break
fi
source $combined
unset zsources combined
