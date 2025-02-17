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
function .zsource() {
  zparseopts -D -E - -arch=arch
  typeset -aU argv=($@)
  local s zsource=${XDG_CACHE_HOME:-~/.cache}/zsh/zsource-${1}$(
    test -z $arch || printf ".%s" `arch`
  )
  shift
  for s ( $@ ); if [[ -f $s ]] && [[ ! $zsource -nt $s ]]
  then
    mkdir -p $zsource:h
    cat $@ > $zsource 2>/dev/null
    zcompile $zsource
    break
  fi
  source $zsource
}

# Shell integrations.
.zsource integrations.zsh --arch \
  `brew --prefix fzf`/shell/*.zsh \
  `brew --caskroom`/miniconda/base/etc/profile.d/conda.sh

# Aggregate ~/.zsource/*.zsh while maintaining order for set names.
.zsource aggregate.zsh ~/.zsource/{options,p10k,antidote,*}.zsh

if type conda &>/dev/null; then
  conda activate base
fi
