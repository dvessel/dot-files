#!/usr/bin/env zsh

if [[ -d /opt/homebrew/opt/antidote ]]
then
  # Lazy-load antidote from its functions directory.
  fpath+=/opt/homebrew/opt/antidote/share/antidote/functions
  autoload -Uz antidote

  local zplugins=$ZDOTDIR/zplugins
  local zpstatic=$XDG_CACHE_HOME/zsh/zplugins.zsh

  # Core plug-in options. @see man antidote
  zstyle ':antidote:bundle' path-style short
  zstyle ':antidote:bundle' file $zplugins
  zstyle ':antidote:static' file $zpstatic
  zstyle ':antidote:*' zcompile yes

  export ANTIDOTE_HOME=$XDG_DATA_HOME/antidote

  [[ -f $zplugins ]] || touch $zplugins
  # Update zpstatic when zplugins is updated, source otherwise.
  if [[ ! $zpstatic -nt $zplugins ]] || ! source $zpstatic 2>/dev/null
  then
    mkdir -p $zpstatic:h
    antidote load
  fi

  # Plug-in options. @see zplugins

  # - mattmc3/ez-compinit
  zstyle ':plugin:ez-compinit' compstyle zshzoo
  zstyle ':plugin:ez-compinit' use-cache yes

  # - romkatv/powerlevel10k
  POWERLEVEL9K_CONFIG_FILE=$ZDOTDIR/zsource/p10k-config.zsh

  # - jeffreytse/zsh-vi-mode
  if (( $+functions[zvm_bindkey] ))
  then
    ZVM_SYSTEM_CLIPBOARD_ENABLED=true
    zvm_bindkey vicmd '/'  history-incremental-pattern-search-backward
    zvm_bindkey vicmd '?'  history-incremental-pattern-search-forward
    zvm_bindkey viins '^R' history-incremental-pattern-search-backward
    zvm_bindkey viins '^S' history-incremental-pattern-search-forward
  fi

  # - marlonrichert/zsh-hist
  if (( $+functions[hist] ))
  then
    # https://github.com/junegunn/fzf/issues/3522#issuecomment-1871374030
    fzf-delete-history-widget() {
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
    zle -N fzf-delete-history-widget
    bindkey -M vicmd '^E' fzf-delete-history-widget
  fi

fi
