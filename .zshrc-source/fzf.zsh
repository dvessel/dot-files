_opts=(
  --reverse
  --scroll-off 7
  --info inline
  --pointer ▏
  --marker '✸\ '
  --ellipsis …
  --preview-window noborder
  --color gutter:-1,hl+:underline,hl:underline
)
export FZF_DEFAULT_OPTS=${_opts[@]}; unset _opts
export FZF_COMPLETION_TRIGGER='..'
