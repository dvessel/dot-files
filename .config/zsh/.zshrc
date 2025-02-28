#!/usr/bin/env zsh

# Powerlevel10k instant prompt.
test ! -f $XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh \
|| source $XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh

# Add local paths, keep [-U]nique.
typeset -gU  path=( ~/.local/{bin,zbin} $path )
typeset -gU fpath=( $ZFUNCDIR $fpath /{usr/local,opt/homebrew}/share/zsh/site-functions(N) )

# Autoload zfunctions from $ZFUNCDIR.
autoload -Uz $ZFUNCDIR/[^_]*(N.:t) &>/dev/null

# Shell integrations are arch-specific.
acsource integrations-`arch` \
  $HOMEBREW_PREFIX/opt/fzf/shell/*.zsh(N) \
  $HOMEBREW_PREFIX/Caskroom/miniconda/base/etc/profile.d/conda.sh

# Aggregate .zsource/*.zsh while maintaining order for set names.
acsource zsource $ZDOTDIR/.zsource/{options,antidote,p10k-config,*}.zsh

# Normally handled by antidote plugin: .zplugins->mattmc3/ez-compinit
if ! type compinit >/dev/null; then
  autoload -Uz compinit; compinit -d $XDG_CACHE_HOME/zsh/zcompdump
fi
