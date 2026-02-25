#!/usr/bin/env zsh

alias rsync-copy='rsync -az --progress -h --exclude=.DS_Store'
alias rsync-move='rsync -az --progress -h --remove-source-files --exclude=.DS_Store'
alias rsync-update='rsync -azu --progress -h --itemize-changes --exclude=.DS_Store'
alias rsync-synchronize='rsync -azu --delete --progress -h --itemize-changes --exclude=.DS_Store'

local list=(
  # 1. alias name
  # 2. test condition
  # 3. source
  # 4. destiationnnn
  "sync-emulation"
  # ROMs are symlinked from 980Pro to ~/Games/Emulation. Make sure it's mounted.
  "test -d /Volumes/980Pro && ping -c1 dvessel-ds.local &>/dev/null"
  "~/Games/{Emulation,Guides}"
  "dvessel-ds.local:/volume1/storage/Emulation"

  "sync-advscan"
  "ping -c1 dvessel-ds.local &>/dev/null"
  "~/Games/Support/AdvanceScan/backup/*"
  "dvessel-ds.local:/volume1/storage/Emulation/MAME"
)

local i=1 presets=()
while (( $i < ${#list[@]} )); do
  presets+="$list[$i]"
  alias "$list[$i]"="$list[$i+1] && {
    printf \"\e[1;15m%s\e[0m\n\" \"Syncing… $list[$i+2] -> $list[$i+3]\"
    rsync-synchronize -L --exclude={'.romlist','.sorted'} $list[$i+2] $list[$i+3]
  }"
  i=$((i+4))
done
alias sync-all="${(j[;echo;])presets}"
