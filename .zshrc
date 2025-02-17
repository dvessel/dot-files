#!/usr/bin/env zsh

# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}
mkdir -p $XDG_CONFIG_HOME $XDG_CACHE_HOME $XDG_DATA_HOME $XDG_STATE_HOME

# Powerlevel10k instant prompt.
test ! -f ${XDG_CACHE_HOME:-~/.cache}/p10k-instant-prompt-${(%):-%n}.zsh \
|| source ${XDG_CACHE_HOME:-~/.cache}/p10k-instant-prompt-${(%):-%n}.zsh

# Add local paths, keep [-U]nique.
typeset -aU  path=(~/.local/{bin,zbin} $path)

# Aggregate->Compile->Source
function acsource() {
  zparseopts -D -E - -arch-specific=arch_specific
  typeset -aU argv=($@)
  local s aggregate=${XDG_CACHE_HOME:-~/.cache}/zsh/${0}-${1}$(
    test -z $arch_specific || printf "-%s" `arch`
  ).zsh
  shift
  for s ( $@ ); if [[ -f $s ]] && [[ ! $aggregate -nt $s ]]
  then
    mkdir -p $aggregate:h
    cat $@ > $aggregate 2>/dev/null
    zcompile $aggregate
    break
  fi
  source $aggregate
}

# Shell integrations.
acsource --arch-specific integrations \
  `brew --prefix fzf`/shell/*.zsh \
  `brew --caskroom`/miniconda/base/etc/profile.d/conda.sh

# Aggregate ~/.zsource/*.zsh while maintaining order for set names.
acsource zsource ~/.zsource/{options,p10k,antidote,*}.zsh

if type conda &>/dev/null; then
  conda activate base
fi
