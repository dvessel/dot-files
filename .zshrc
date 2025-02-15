#!/usr/bin/env zsh

# Powerlevel10k instant prompt.
test ! -f ~/.cache/p10k-instant-prompt-${(%):-%n}.zsh \
|| source ~/.cache/p10k-instant-prompt-${(%):-%n}.zsh

# Add local paths, keep [-U]nique.
typeset -aU  path=(~/.local/{bin,zbin} $path)

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
