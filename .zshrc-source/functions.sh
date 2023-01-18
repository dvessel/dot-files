#!/usr/bin/env zsh

function .. {
  builtin cd $OLDPWD
}

function lb {
  local sent=${@-:} && [[ ${sent[1]} != / ]] && sent=`pwd`/$sent
  if [[ -a $sent ]]; then
    open "x-launchbar:select?file=`url.encode $sent`"
  else
    open "x-launchbar:select?string=$sent"
  fi
}

function dir.sortbysize {
  du -sh ${@:-*} | sort -rh
}

function tm.log {
  local time=${@:-1H}
  log show --style syslog --info --start "$(date -j -v-$time +'%Y-%m-%d %H:%M:%S')" \
    --predicate 'processImagePath contains "backupd" and subsystem beginswith "com.apple.TimeMachine"'
}
function tm.fs_usage {
  sudo fs_usage -f filesys backupd
}

function brew.executables {
  brew unlink --dry-run $@ | pcregrep -o1 "$(brew --prefix)/bin/(.*)"
}

function prfzf {
  GH_FORCE_TTY=100%
  gh pr list |
    fzf --ansi --preview 'GH_FORCE_TTY=100% gh pr view {1}' --preview-window down --header-lines 3 |
      awk '{print $1}' |
        xargs gh pr checkout
}

# Encode/decode url's.
function url.decode {
  echo "$@" | sed -E 's/%([0-9a-fA-F]{2})/\\x\1/g;s/\+/ /g'
}
# Conforme RFC 3986
function url.encode {
  echo "$@" | sed \
  -e 's/ /%20/g'  \
  -e 's/:/%3A/g'  \
  -e 's/,/%2C/g'  \
  -e 's/\?/%3F/g' \
  -e 's/#/%23/g'  \
  -e 's/\[/%5B/g' \
  -e 's/\]/%5D/g' \
  -e 's/@/%40/g'  \
  -e 's/!/%41/g'  \
  -e 's/\$/%24/g' \
  -e 's/&/%26/g'  \
  -e "s/'/%27/g"  \
  -e 's/(/%28/g'  \
  -e 's/)/%29/g'  \
  -e 's/\*/%2A/g' \
  -e 's/\+/%2B/g' \
  -e 's/,/%2C/g'  \
  -e 's/;/%3B/g'  \
  -e 's/=/%3D/g'
}
