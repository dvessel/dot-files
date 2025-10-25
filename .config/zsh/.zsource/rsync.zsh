#!/usr/bin/env zsh

alias rsync-copy='rsync -avz --progress -h --exclude=.DS_Store'
alias rsync-move='rsync -avz --progress -h --remove-source-files --exclude=.DS_Store'
alias rsync-update='rsync -avzu --progress -h --itemize-changes --exclude=.DS_Store'
alias rsync-synchronize='rsync -avzu --delete --progress -h --itemize-changes --exclude=.DS_Store'

local list=(
  "sync-emulation"
  # ROMs are symlinked from 980Pro to ~/Games/Emulation.
  "test -d /Volumes/980Pro && ping -c1 dvessel-ds.local &>/dev/null"
  "~/Games/{Emulation,Guides}"
  "dvessel-ds.local:/volume1/storage/Emulation"

  "sync-advscan"
  "ping -c1 dvessel-ds.local &>/dev/null"
  "~/Games/Support/AdvanceScan/backup/*"
  "dvessel-ds.local:/volume1/storage/Emulation/MAME"
)

local i=1 presets=() header
while (( $i < ${#list[@]} )); do
  presets+="$list[$i]"
  header="printf \"\e[1;15m%s\e[0m\n\" \"Syncing… $list[$i+2] -> $list[$i+3]\""
  alias "$list[$i]"="$list[$i+1] && { $header; rsync-synchronize -L $list[$i+2] $list[$i+3] }"
  i=$((i+4))
done
alias sync-all="${(j[;echo;])presets}"
