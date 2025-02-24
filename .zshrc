#!/usr/bin/env zsh

# Powerlevel10k instant prompt.
test ! -f $XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh \
|| source $XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh

# Add local paths, keep [-U]nique.
typeset -gU path=( ~/.local/{bin,zbin} $path )

# Aggregate->Compile->Source
function acsource() {
  typeset -aU argv=( $@ )
  local s aggregate=$XDG_CACHE_HOME/zsh/${0}-${1}.zsh
  shift
  for s ( $@ ) {
    if [[ ! -f $aggregate ]] || [[ $s -nt $aggregate ]]; then
      mkdir -p $aggregate:h
      cat $@ > $aggregate 2>/dev/null
      zcompile $aggregate
      break
    fi
  }
  source $aggregate
}

# Shell integrations are arch-specific.
acsource integrations-`arch` \
  $HOMEBREW_PREFIX/opt/fzf/shell/*.zsh(N) \
  $HOMEBREW_PREFIX/Caskroom/miniconda/base/etc/profile.d/conda.sh

# Aggregate ~/.zsource/*.zsh while maintaining order for set names.
acsource zsource ~/.zsource/{options,p10k,antidote,*}.zsh

if ! type compinit >/dev/null; then
  # Normally handled by antidote plugin:
  # @see ~/.zplugins - mattmc3/ez-compinit
  autoload -Uz compinit; compinit
fi
