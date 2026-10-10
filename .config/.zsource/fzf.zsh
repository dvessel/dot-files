#!/usr/bin/env zsh

if [[ -z $commands[fzf] && -d /opt/homebrew/opt/fzf ]]
then path+=/opt/homebrew/opt/fzf/bin
fi

if (( $+commands[fzf] ))
then
  local opts=(
    --reverse
    --scroll-off 7
    --info inline
    --gutter │
    --pointer ┃
    --marker ⁕ 
    --ellipsis …
    --preview-window border-rounded
    --color pointer:red,marker:red,hl+:-1
    --color gutter:-1,fg+:-1,bg+:-1,hl+:underline,hl:underline
  )
  # @see .zplugins->Aloxaf/fzf-tab
  zstyle ':fzf-tab:complete:*' fzf-flags $opts
  
  export FZF_DEFAULT_OPTS=${opts[@]}
  export FZF_COMPLETION_TRIGGER='..'
fi

