#!/usr/bin/env zsh

# https://github.com/junegunn/fzf#setting-up-shell-integration
source <(fzf --zsh)

_opts=(
  --reverse
  --scroll-off 7
  --info inline
  --pointer ▏
  --marker +
  --ellipsis …
  --preview-window noborder
  --color gutter:-1,hl+:underline,hl:underline
)
zstyle ':fzf-tab:complete:*' fzf-flags $_opts

export FZF_DEFAULT_OPTS=${_opts[@]}; unset _opts
export FZF_COMPLETION_TRIGGER='..'
