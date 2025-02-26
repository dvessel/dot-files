#!/usr/bin/env zsh

# Powerlevel10k instant prompt.
test ! -f $XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh \
|| source $XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh

# Add local paths, keep [-U]nique.
typeset -gU fpath path=( ~/.local/{bin,zbin} $path )

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
acsource zsource ~/.zsource/{options,antidote,p10k-config,*}.zsh

# Tell `p10k configure` which file it should overwrite.
typeset -g POWERLEVEL9K_CONFIG_FILE=$HOME/.zsource/p10k-config.zsh

# Autoload zfunctions from the local directory.
zfunctions=( $ZFUNCDIR/[^_]*(N.:t) )
if (( $#zfunctions > 0 )); then
  fpath=( $ZFUNCDIR $fpath )
  autoload -Uz $zfunctions
fi
unset zfunctions

# Normally handled by antidote plugin: ~/.zplugins->mattmc3/ez-compinit
if ! type compinit >/dev/null; then
  autoload -Uz compinit; compinit -d $XDG_CACHE_HOME/zsh/zcompdump
fi
