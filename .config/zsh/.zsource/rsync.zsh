#!/usr/bin/env zsh

alias rsync-copy='rsync -avz --progress -h --exclude=.DS_Store'
alias rsync-move='rsync -avz --progress -h --remove-source-files --exclude=.DS_Store'
alias rsync-update='rsync -avzu --progress -h --itemize-changes --exclude=.DS_Store'
alias rsync-synchronize='rsync -avzu --delete --progress -h --itemize-changes --exclude=.DS_Store'

local list=(
  "rsync-emulation-ii-980pro"   #1. alias name
  "test -d /Volumes/980Pro"     #2. condition
  "~/Games/Emulation"           #3. source
  "/Volumes/980Pro"             #4. destination

  "rsync-advancescan-ii-storage-emulation-mame"
  "test -d /Volumes/Storage"
  "~/Games/Support/OpenEmu/AdvanceScan/_{unknown,import/_updates}"
  "/Volumes/Storage/Emulation/MAME"

  "rsync-storage-ii-diskstation-storage"
  "test -d /Volumes/Storage && ping -c1 dvessel-ds.local &>/dev/null"
  "/Volumes/Storage/*"
  "dvessel-ds.local:/volume1/storage"
)

local i=1 presets=() header
while (( $i < ${#list[@]} )); do
  presets+="$list[$i]"
  header="printf \"\e[1;15m%s\e[0m\n\" \"Syncing… $list[$i+2] -> $list[$i+3]\""
  alias "$list[$i]"="$list[$i+1] && { $header; rsync-synchronize -L $list[$i+2] $list[$i+3] }"
  i=$((i+4))
done
alias rsync-ii-all="${(j[;echo;])presets}"
