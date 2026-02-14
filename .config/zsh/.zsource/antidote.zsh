#!/usr/bin/env zsh

if test -d /opt/homebrew/opt/antidote; then
  # Lazy-load antidote from its functions directory.
  fpath+=/opt/homebrew/opt/antidote/share/antidote/functions
  autoload -Uz antidote

  # Core plug-in options. @see man antidote
  local zplugins=$ZDOTDIR/.zplugins
  local zpstatic=$XDG_CACHE_HOME/zsh/zplugins.zsh

  export ANTIDOTE_HOME=$XDG_CACHE_HOME/antidote
  zstyle ':antidote:bundle' use-friendly-names 'yes'
  zstyle ':antidote:bundle' file $zplugins
  zstyle ':antidote:static' file $zpstatic
  zstyle ':antidote:*' zcompile 'yes'

  test -f $zplugins || touch $zplugins

  if test ! $zpstatic -nt $zplugins; then
    # Generate new static file when zplugins is updated.
    mkdir -p $zpstatic:h
    antidote load
  else
    # Manually source when antidote doesn't need to load.
    source $zpstatic
  fi

  # Plug-in options. @see .zplugins

  # - mattmc3/ez-compinit
  zstyle ':plugin:ez-compinit' 'compstyle' 'zshzoo'
  zstyle ':plugin:ez-compinit' 'use-cache' 'no'

  # - dvessel/zsh-completion-generator
  export GENCOMPL_FPATH=$ZFUNCDIR

  # - jeffreytse/zsh-vi-mode
  ZVM_SYSTEM_CLIPBOARD_ENABLED=true
  function zvm_after_init() {
    # Unbind the default backward/forward search.
    bindkey -r -M viins '^R'
    bindkey -r -M viins '^S'
    # Restore Aloxaf/fzf-tab history search.
    if type fzf-history-widget &>/dev/null; then
      zvm_bindkey viins '^R' fzf-history-widget
    fi
    zvm_bindkey vicmd '/' history-incremental-pattern-search-backward
    zvm_bindkey vicmd '?' history-incremental-pattern-search-forward
    # Active ctrl-[r|s] in interactive search mode triggered by vicmd search.
    zvm_bindkey isearch '^R' history-incremental-pattern-search-backward
    zvm_bindkey isearch '^S' history-incremental-pattern-search-forward
  }

  # - marlonrichert/zsh-hist
  #  https://github.com/junegunn/fzf/issues/3522#issuecomment-1871374030
  function fzf-delete-history-widget() {
    setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases 2>/dev/null
    fc -pa $HISTFILE
    local selected=($(
      printf '%s\t%s\000' "${(kv)history[@]}" |
      perl -0 -ne 'if (!$seen{(/^\s*[0-9]+\**\t(.*)/s, $1)}++) { s/\n/\n\t/g; print; }' |
      FZF_DEFAULT_OPTS=$(
        __fzf_defaults "" "-n2..,.. --scheme=history --bind=ctrl-r:toggle-sort
        --wrap-sign '\t↳ ' ${FZF_CTRL_R_OPTS-} --prompt='! ' --query=${(qqq)LBUFFER}
        +m --multi --read0 --bind 'enter:become(echo {+1})'"
      ) $(__fzfcmd)
    ))
    local ret=$?
    if [[ -n "$selected[*]" ]]; then
      hist delete $selected[*]
    fi
    zle reset-prompt
    return $ret
  }
  if type hist &>/dev/null; then
    zle -N fzf-delete-history-widget
    # ctrl-opt-r to trigger widget.
    bindkey -M vicmd '^[^R' fzf-delete-history-widget
    bindkey -M viins '^[^R' fzf-delete-history-widget
  fi

fi
