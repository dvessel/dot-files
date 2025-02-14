#!/usr/bin/env zsh

# Powerlevel10k instant prompt.
test ! -f ~/.cache/p10k-instant-prompt-${(%):-%n}.zsh \
|| source ~/.cache/p10k-instant-prompt-${(%):-%n}.zsh

# Add local paths and prevent duplicates.
typeset -aU  path=(~/.local/{bin,zbin} $path)
typeset -aU fpath=(~/.local/zcompletions /{opt/homebrew,usr/local}/share/zsh/site-functions $fpath)

source ~/.zsource/options.zsh
source ~/.zsource/p10k.zsh
source ~/.zsource/aliases.zsh
source ~/.zsource/antidote.zsh
source ~/.zsource/conda.zsh
source ~/.zsource/displayplacer.sh
source ~/.zsource/fzf.zsh
source ~/.zsource/rsync.zsh
