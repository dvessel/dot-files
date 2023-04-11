#!/usr/bin/env zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
p10k_cpath=~/.cache/p10k-instant-prompt-${(%):-%n}.zsh
[ ! -f $p10k_cpath ] || source $p10k_cpath

# Shows all paths with `/usr/libexec/path_helper`.
path+=~/.local/bin; export path

for zs in ~/.zshrc-source/*.zsh; source $zs

if type brew &>/dev/null; then
  # Homebrew managed shell completions: https://docs.brew.sh/Shell-Completion
  # `autoload -Uz compinit; compinit` handled by antidote plugin:`belak/zsh-utils path:completion`.
  fpath=( `brew --prefix`/share/zsh/site-functions $fpath )
fi

if type antidote &>/dev/null; then
  zstyle ':antidote:bundle' use-friendly-names 'yes'
  antidote load
fi
