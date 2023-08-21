
# https://iterm2.com/3.3/documentation-variables.html
# https://iterm2.com/3.3/documentation-scripting-fundamentals.html
function iterm2_print_user_vars {
  iterm2_set_user_var arch `arch`
}

function brew.tree {
  brew deps --include-build --tree $@
}
function brew.binaries {
  if [[ -z $@ ]]; then
    echo "Formula required." >&2; return 1 
  fi
  brew unlink --dry-run $@ | grep "`brew --prefix`/bin/.*" | cut -d/ -f5
}

function tm.is-excluded {
  tmutil isexcluded $@
}
function tm.exclude {
  tmutil addexclusion $@ && _brew_check tag {}
    tag -a "Time Machine - Excluded" $@
}
function tm.include {
  tmutil removeexclusion $@ &&
    tag -r "Time Machine - Excluded" $@
}
function tm.find-excluded {
  mdfind "com_apple_backup_excludeItem = 'com.apple.backupd'"
}
function tm.log {
  local time=${@:-1H}
  log show --style syslog --info --start "$(date -j -v-$time +'%Y-%m-%d %H:%M:%S')" --predicate \
    'processImagePath contains "backupd" and subsystem beginswith "com.apple.TimeMachine"'
}
function tm.fs_usage {
  sudo fs_usage -f filesys backupd
}

function prfzf {
  if _brew_check gh fzf; then
    GH_FORCE_TTY=100%
    gh pr list |
      fzf --ansi --preview 'GH_FORCE_TTY=100% gh pr view {1}' --preview-window down --header-lines 3 |
        awk '{print $1}' |
          xargs gh pr checkout
  fi
}

# Encode/decode url's.
function url.decode {
  echo "$@" | sed -E 's/%([0-9a-fA-F]{2})/\\x\1/g;s/\+/ /g'
}
# Conforms to RFC 3986
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
