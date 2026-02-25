#!/usr/bin/env zsh

# Load order of dotfiles:
# 1. ~/.zshenv
# 2. ~/.config/zsh/.zprofile
# 3. ~/.config/zsh/.zshrc <-
# 4. ~/.config/zsh/.zlogin

# Powerlevel10k instant prompt.
test ! -f $XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh \
|| source $XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh

# Add local paths, keep [-U]nique.
typeset -gU  path=( ~/.local/{bin,zbin} $path )
typeset -gU fpath=( $ZFUNCDIR $fpath /{usr/local,opt/homebrew}/share/zsh/site-functions(N) )

# Autoload zfunctions from $ZFUNCDIR.
autoload -Uz $ZFUNCDIR/[^_]*(N.:t) &>/dev/null

# Shell integrations and aggregated .zsource/*.zsh. Maintain order for set names.
acsource zsh-aggregate \
  /opt/homebrew/opt/fzf/shell/{key-bindings,completion}.zsh(N) \
  /opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh \
  $ZDOTDIR/.zsource/{options,antidote,p10k-config,*}.zsh

# Normally handled by antidote plugin: .zplugins->mattmc3/ez-compinit
if ! type compinit &>/dev/null; then
  autoload -Uz compinit; compinit -d $XDG_CACHE_HOME/zsh/zcompdump
fi
