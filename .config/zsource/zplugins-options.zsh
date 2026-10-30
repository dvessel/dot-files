#!/usr/bin/env zsh
# antidote plug-in options. @see $ZDOTDIR/zplugins

# - mattmc3/ez-compinit
zstyle ':plugin:ez-compinit' compstyle zshzoo
zstyle ':plugin:ez-compinit' use-cache yes

# - yachtida/zsh-abbr-plugin
export ZSH_ABBR_USER_FILE=$ZDOTDIR/zabbreviations

# - jeffreytse/zsh-vi-mode
export ZVM_SYSTEM_CLIPBOARD_ENABLED=true
function zsh-vi-mode-options {
  zvm_bindkey vicmd '/'  history-incremental-pattern-search-backward
  zvm_bindkey vicmd '?'  history-incremental-pattern-search-forward
  zvm_bindkey viins '^R' history-incremental-pattern-search-backward
  zvm_bindkey viins '^S' history-incremental-pattern-search-forward
}

# - marlonrichert/zsh-hist
function zsh-hist-options {
  zle -N zsh-hist-fzf-delete-widget
  bindkey -M vicmd '^E' zsh-hist-fzf-delete-widget
}
# https://github.com/junegunn/fzf/issues/3522#issuecomment-1871374030
function zsh-hist-fzf-delete-widget {
  setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases 2>/dev/null
  local selected=($( fc -rl 1 |
    awk '{ cmd=$0; sub(/^[ \t]*[0-9]+\**[ \t]+/, "", cmd); if (!seen[cmd]++) print $0 }' |
    FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS $FZF_CTRL_R_OPTS
      --header 'delete history'
      --height ${FZF_TMUX_HEIGHT:-70%}
      --query=${(qqq)LBUFFER} -n2..,.. --multi
      --bind 'ctrl-r:toggle-sort,ctrl-z:ignore'
      --bind 'enter:become(echo {+1})'" $(__fzfcmd) ))
  local ret=$?
  if (( $#selected > 0 ))
  then hist delete $selected
  fi
  zle reset-prompt
  return $ret
}
