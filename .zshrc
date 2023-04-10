#!/usr/bin/env zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
p10k_cpath=~/.cache/p10k-instant-prompt-${(%):-%n}.zsh
[ ! -f $p10k_cpath ] || source $p10k_cpath

if type brew &>/dev/null; then
  # Homebrew managed shell completions: https://docs.brew.sh/Shell-Completion
  # `autoload -Uz compinit; compinit` handled by .zsh_plugins.txt:`belak/zsh-utils path:completion`.
  fpath=( `brew --prefix`/share/zsh/site-functions $fpath )
fi

antidote_path=/opt/homebrew/opt/antidote/share/antidote/antidote.zsh
if [ -f $antidote_path ]; then
  source $antidote_path
  zstyle ':antidote:bundle' use-friendly-names 'yes'
  antidote load
fi

# Shows all paths with `/usr/libexec/path_helper`.
path+=$HOME/.local/bin
export path

# Editors
editor='code -w'
git_editor='code -w'

# Case insensitive autocomplete and globbing.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
setopt no_case_glob

export HISTSIZE=100000
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt share_history

for sh in `find $HOME/.zshrc-source -name '*.sh'`; source $sh
