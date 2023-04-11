#!/usr/bin/env zsh

( type brew &>/dev/null; type fzf &>/dev/null ) || return 1

# https://github.com/junegunn/fzf
# fzf shell integration.

brew_path=`brew --prefix`

# Setup fzf
# ---------
if [[ ! "$PATH" == *$brew_path/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}$brew_path/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$brew_path/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$brew_path/opt/fzf/shell/key-bindings.zsh"

# Customizations
# --------------
FZF_DEFAULT_OPTS='--reverse --scroll-off 10 --info inline --prompt "❯ " --pointer ▏ --marker ▶︎ --ellipsis … '
FZF_DEFAULT_OPTS+='--preview-window noborder --color gutter:-1,hl+:underline,hl:underline '
export FZF_DEFAULT_OPTS

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_brew_check fd && printf "%s\n" "fzf_compgen* not configured to use fd." || (
  export FZF_DEFAULT_COMMAND='fd --type f'
  _fzf_compgen_path() { fd --follow . "$1" }
  _fzf_compgen_dir() { fd --type d --follow . "$1" }
)