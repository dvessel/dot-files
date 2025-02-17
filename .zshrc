#!/usr/bin/env zsh

# Powerlevel10k instant prompt.
test ! -f ~/.cache/p10k-instant-prompt-${(%):-%n}.zsh \
|| source ~/.cache/p10k-instant-prompt-${(%):-%n}.zsh

# Add local paths, keep [-U]nique.
typeset -aU  path=(~/.local/{bin,zbin} $path)

# Aggregate->Compile->Source
function .zsource() {
  typeset -aU argv=($@)
  local s zsource=~/.zsource/$1
  shift
  for s ( $@ ); if [[ ! $zsource -nt $s ]]; then
    cat $@ > $zsource
    zcompile $zsource
    break
  fi
  source $zsource
}

if type fzf &>/dev/null; then
  # fzf shell integration.
  .zsource fzf-integration!zsh `brew --prefix fzf`/shell/*.zsh
fi
# Aggregate ~/.zsource/*.zsh while maintaining order for set names.
.zsource zsource!zsh ~/.zsource/{options,p10k,antidote,*}.zsh
