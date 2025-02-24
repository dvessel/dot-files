#!/usr/bin/env zsh

local opts=(
  --reverse
  --scroll-off 7
  --info inline
  --pointer ┃
  --marker ⁕ 
  --ellipsis …
  --preview-window border-rounded
  --color pointer:red,marker:red,hl+:-1
  --color gutter:-1,fg+:-1,bg+:-1,hl+:underline,hl:underline
)
# @see ~/.zplugins - Aloxaf/fzf-tab
zstyle ':fzf-tab:complete:*' fzf-flags $opts

export FZF_DEFAULT_OPTS=${opts[@]}
export FZF_COMPLETION_TRIGGER='..'
