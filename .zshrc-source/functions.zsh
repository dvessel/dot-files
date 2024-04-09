function arch-toggle {
  case `sysctl -n sysctl.proc_translated` in
    0) arch -d PATH --x86_64 /bin/zsh -l ;;
    1) exit ;;
  esac
}

function brew-tree {
  brew deps --include-build --tree ${@:---installed}
}
function brew-binaries {
  if [[ -z $@ ]]; then
    echo "Formula required." >&2; return 1
  fi
  brew unlink --dry-run $@ | grep "`brew --prefix`/bin/.*" | cut -d/ -f5
}
function brew-bundle {
  zparseopts -D -E - \
    {n,-name}:=name \
    {-all,-formula,-brews,-cask,-casks,-tap,-taps,-vscode}=set || return 1
  if [[ -z $name && -z $set ]]; then
    name=default
    set=(--tap --formula --cask)
  elif [[ -z $name && ${#set[@]} == 1 ]]; then
    name=${set/--/}
  else
    echo "--name <name> required for multiple listed: $set." >&2
    return 1
  fi
  brew bundle $@ $set --describe --no-lock --file ~/.config/brew/bundle-$name-`machine`
}

function gh-pr-list {
  gh pr list | fzf --ansi --preview 'GH_FORCE_TTY=100% gh pr view {1}' --preview-window down |
    awk '{print $1}' | xargs gh pr $@
}
function rgit {
  while read -r p; do
    echo "\e[1;30m$p:h\e[0m"; git --git-dir=$p --work-tree=$p:h $@; echo
  done < <( fd --glob .git . --type d --hidden --no-ignore )
}

function tm-is-excluded {
  tmutil isexcluded $@
}
function tm-exclude {
  tmutil addexclusion $@ && tag -a "Time Machine - Excluded" $@
}
function tm-include {
  tmutil removeexclusion $@ && tag -r "Time Machine - Excluded" $@
}
function tm-find-excluded {
  tag -Rm "Time Machine - Excluded" $@
}
function tm-mdfind-excluded {
  mdfind "com_apple_backup_excludeItem = 'com.apple.backupd'"
}
function tm-log {
  log show --style syslog --info --start "$(date -j -v-${@:-1H} +'%Y-%m-%d %H:%M:%S')" --predicate \
    'processImagePath contains "backupd" and subsystem beginswith "com.apple.TimeMachine"' | tspin
}
function tm-fs_usage {
  sudo fs_usage -f filesys backupd | tspin
}

function eject {
  diskutil eject `diskutil info /Volumes/$@ | grep "Device Identifier" | awk '{print $3}'`
}
function inodeInfo {
  zparseopts -D -E -F - {v,-volume}:=vol || return 1
  GetFileInfo /.vol/`stat -f %d ${vol[-1]:-./}`/$1
}

# Encode/decode url's.
function url-decode {
  echo "$@" | sed -E 's/%([0-9a-fA-F]{2})/\\x\1/g;s/\+/ /g'
}
# Conforms to RFC 3986
function url-encode {
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
