_brew_check fzf || return

FZF_DEFAULT_OPTS='--reverse --scroll-off 6 --info inline --pointer ▏'
FZF_DEFAULT_OPTS+=' --marker ▏ --ellipsis … --preview-window noborder'
FZF_DEFAULT_OPTS+=' --color gutter:-1,hl+:underline,hl:underline'
export FZF_DEFAULT_OPTS
export FZF_COMPLETION_TRIGGER='..'

if _brew_check fd; then
  export FZF_DEFAULT_COMMAND='fd --type f'
  _fzf_compgen_path() { fd --follow . "$1" }
  _fzf_compgen_dir() { fd --type d --follow . "$1" }
fi
