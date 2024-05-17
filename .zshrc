#!/usr/bin/env zsh

# Powerlevel10k instant prompt and core zsh options.
for zh in .cache/p10k-instant-prompt-${(%):-%n}.zsh .zoptions.zsh; do
  test ! -f ~/$zh || source ~/$zh
done

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
