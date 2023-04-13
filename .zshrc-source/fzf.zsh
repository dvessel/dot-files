#!/usr/bin/env zsh

type brew &>/dev/null && type fzf &>/dev/null || return 1

# Auto-completion
# ---------------
[[ $- == *i* ]] && source `brew --prefix`/opt/fzf/shell/completion.zsh 2> /dev/null

# Key bindings
# ------------
source `brew --prefix`/opt/fzf/shell/key-bindings.zsh

# Customizations
# --------------
FZF_DEFAULT_OPTS='--reverse --scroll-off 10 --info inline --prompt "❯ " --pointer "▏"'
FZF_DEFAULT_OPTS+=' --marker ▶︎ --ellipsis … --preview-window noborder'
FZF_DEFAULT_OPTS+=' --color gutter:-1,hl+:underline,hl:underline'
export FZF_DEFAULT_OPTS
export FZF_COMPLETION_TRIGGER='`'

if type fd &>/dev/null; then
  export FZF_DEFAULT_COMMAND='fd --type f'
  _fzf_compgen_path() { fd --follow . "$1" }
  _fzf_compgen_dir() { fd --type d --follow . "$1" }
fi
