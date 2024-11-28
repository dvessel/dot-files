#!/usr/bin/env zsh

# Powerlevel10k instant prompt.
zs=~/.cache/p10k-instant-prompt-${(%):-%n}.zsh
test ! -f $zs || source $zs

if type brew &>/dev/null; then
  export HOMEBREW_NO_ENV_HINTS=1

  # Formulae must be installed for both arm and x86.
  for zs in `brew --prefix antidote`/share/antidote/antidote.zsh \
            `brew --prefix fzf`/shell/{completion,key-bindings}.zsh
  do ! test -r $zs || source $zs; done

  fpath=(/{opt/homebrew,usr/local}/share/zsh/site-functions $fpath)
fi

if type antidote &>/dev/null; then
  # Plug-in options. @see .zsh_plugins.txt
  # - mattmc3/ez-compinit
  zstyle ':plugin:ez-compinit' 'compstyle' 'zshzoo'
  # - mattmc3/zephyr plugins:zfunctions
  ZFUNCDIR=~/.local/zfunctions
  # - dvessel/zsh-completion-generator
  GENCOMPL_FPATH=~/.local/zcompletions
  # - mattmc3/zephyr plugins:zman
  ZMAN_URL=https://zsh-manual.netlify.app

  ANTIDOTE_HOME=~/.cache/antidote
  zstyle ':antidote:bundle' use-friendly-names 'yes'
  antidote load
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

for zs in ~/.zshrc-source/*.zsh(N); source $zs
unset zs
