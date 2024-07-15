#!/usr/bin/env zsh

# Powerlevel10k instant prompt.
zh=~/.cache/p10k-instant-prompt-${(%):-%n}.zsh
test ! -f $zh || source $zh

if type brew &>/dev/null; then
  export HOMEBREW_NO_ENV_HINTS=1

  # Formulae must be installed for both arm and x86.
  for zs in `brew --prefix antidote`/share/antidote/antidote.zsh \
            `brew --prefix fzf`/shell/{completion,key-bindings}.zsh
  do ! test -r $zs || source $zs; done

  fpath=(`brew --prefix`/share/zsh/site-functions $fpath)
fi

if type antidote &>/dev/null; then
  zstyle ':antidote:bundle' use-friendly-names 'yes'
  ANTIDOTE_HOME=~/.cache/antidote
  # mattmc3/zephyr plugins:zfunctions
  ZFUNCDIR=~/.local/zfunctions
  # dvessel/zsh-completion-generator
  GENCOMPL_FPATH=~/.local/zcompletions
  # mattmc3/zephyr plugins:zman
  ZMAN_URL=https://zsh-manual.netlify.app
  antidote load
else
  # Normally handled by antidote plugin:
  # - `mattmc3/zephyr path:plugins/completion`
  autoload -Uz compinit; compinit
fi

# Add local paths and prevent duplicates.
typeset -aU  path=(~/.local/{bin,zbin} $path)
typeset -aU fpath=(~/.local/zcompletions $fpath)

for zs in ~/.zshrc-source/*.zsh(N); source $zs
unset zs
