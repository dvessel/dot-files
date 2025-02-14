#!/usr/bin/env zsh

# Powerlevel10k instant prompt.
test ! -f ~/.cache/p10k-instant-prompt-${(%):-%n}.zsh \
|| source ~/.cache/p10k-instant-prompt-${(%):-%n}.zsh

source ~/.zsource/options.zsh

if type brew &>/dev/null; then
  export HOMEBREW_NO_ENV_HINTS=1

  # Formulae must be installed for both arm and x86.
  for zs in `brew --prefix antidote`/share/antidote/antidote.zsh \
            `brew --prefix fzf`/shell/{completion,key-bindings}.zsh
  do ! test -r $zs || source $zs; done; unset zs

  fpath=(/{opt/homebrew,usr/local}/share/zsh/site-functions $fpath)
fi

if type antidote &>/dev/null; then
  # Plug-in options. @see .zsh_plugins
  # - mattmc3/ez-compinit
  zstyle ':plugin:ez-compinit' 'compstyle' 'zshzoo'
  zstyle ':plugin:ez-compinit' 'use-cache' 'yes'
  # - mattmc3/zephyr plugins:zfunctions
  export ZFUNCDIR=~/.local/zfunctions
  # - dvessel/zsh-completion-generator
  export GENCOMPL_FPATH=~/.local/zcompletions

  export ANTIDOTE_HOME=~/.cache/antidote
  zstyle ':antidote:bundle' use-friendly-names 'yes'
  if [[ ! ~/.zsource/zplugins.zsh -nt ~/.zplugins ]]; then
    antidote bundle <~/.zplugins >~/.zsource/zplugins.zsh
  fi
  source ~/.zsource/zplugins.zsh
else
  # Normally handled by antidote plugin:
  # - mattmc3/ez-compinit
  autoload -Uz compinit && compinit
fi

if type conda &>/dev/null; then
  eval "$(conda 'shell.zsh' 'hook' 2> /dev/null)"
fi

# Add local paths and prevent duplicates.
typeset -aU  path=(~/.local/{bin,zbin} $path)
typeset -aU fpath=(~/.local/zcompletions $fpath)

source ~/.zsource/p10k.zsh
source ~/.zsource/aliases.zsh
source ~/.zsource/fzf.zsh
source ~/.zsource/odds-n-ends.zsh
