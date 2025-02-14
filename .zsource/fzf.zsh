#!/usr/bin/env zsh

# https://github.com/junegunn/fzf#setting-up-shell-integration
source <(fzf --zsh)

opts=(
  --reverse
  --scroll-off 7
  --info inline
  --pointer ▏
  --marker +
  --ellipsis …
  --preview-window noborder
  --color gutter:-1,hl+:underline,hl:underline
)
zstyle ':fzf-tab:complete:*' fzf-flags $opts

export FZF_DEFAULT_OPTS=${opts[@]}
export FZF_COMPLETION_TRIGGER='..'

unset opts
