#!/usr/bin/env zsh

type fzf &>/dev/null && type git &>/dev/null || return 1

# GIT heart FZF
# https://junegunn.kr/2016/07/fzf-git/
# keybindings:
# ctrl-g,f: get modified file.
# ctrl-g,b: get branch.
# ctrl-g,t: get tag.
# ctrl-g,h: get hash from history.
# ctrl-g,r: get remote.
_fzfgf() {
  git rev-parse HEAD > /dev/null 2>&1 || return
  git -c color.status=always status --short | fzf --color bg+:8,fg+:-1 -m --ansi --nth 2..,.. --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1}) | delta | head -500' | cut -c4- | sed 's/.* -> //'
}
_fzfgb() {
  git rev-parse HEAD > /dev/null 2>&1 || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort | fzf --color bg+:8,fg+:-1 --ansi --multi --tac --preview-window right:70% --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1) | head -'$LINES | sed 's/^..//' | cut -d' ' -f1 | sed 's#^remotes/##'
}
_fzfgt() {
  git rev-parse HEAD > /dev/null 2>&1 || return
  git tag --sort -version:refname | fzf --color bg+:8,fg+:-1 --multi --preview-window right:70% --preview 'git show --color=always {} | delta | head -'$LINES
}
_fzfgh() {
  git rev-parse HEAD > /dev/null 2>&1 || return
  git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always | fzf --color bg+:8,fg+:-1 --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' --header 'Press CTRL-S to toggle sort' --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always | delta | head -'$LINES | grep -o "[a-f0-9]\{7,\}"
}
_fzfgr() {
  git rev-parse HEAD > /dev/null 2>&1 || return
  git remote -v | awk '{print $1 "\t" $2}' | uniq | fzf --color bg+:8,fg+:-1 --tac --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" {1} | head -200' | cut -d$'\t' -f1
}

_fzfjoin() {
  while read i; do echo -n "${(q)i} "; done
}
_bind_keys() {
  for k in $@; do
    eval "fzf-g$k-widget() { local result=\$(_fzfg$k | _fzfjoin); zle reset-prompt; LBUFFER+=\$result }"
    eval "zle -N fzf-g$k-widget"
    eval "bindkey '^g^$k' fzf-g$k-widget"
  done
}
_bind_keys f b t r h && unset -f _bind_keys
