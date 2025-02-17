#!/usr/bin/env zsh

# Powerlevel10k instant prompt.
test ! -f ~/.cache/p10k-instant-prompt-${(%):-%n}.zsh \
|| source ~/.cache/p10k-instant-prompt-${(%):-%n}.zsh

# Add local paths, keep [-U]nique.
typeset -aU  path=(~/.local/{bin,zbin} $path)

# Aggregate->Compile->Source
function .zsource() {
  zparseopts -D -E - -arch=arch
  typeset -aU argv=($@)
  local s zsource=~/.zsource/${1}$(
    test -z $arch || printf ".%s" `arch`
  )
  shift
  for s ( $@ ); if [[ -f $s ]] && [[ ! $zsource -nt $s ]]
  then
    cat $@ > $zsource 2>/dev/null
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
