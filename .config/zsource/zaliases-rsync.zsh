#!/usr/bin/env zsh

if (( $+commands[rsyncy] ))
then alias rsync='rsyncy'
else alias rsync='rsync --progress -h'
fi

alias rsync-copy='rsync --exclude=.DS_Store -az'
alias rsync-move='rsync-copy --remove-source-files'
alias rsync-update='rsync-copy -u --itemize-changes'
alias rsync-synchronize='rsync-copy -u --delete --itemize-changes'

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
  "~/Games/Support/AdvanceScan/mamezip/*"
  "dvessel-ds.local:/volume1/storage/Emulation/MAME"
)

local i=1 presets=()
while (( i < ${#list[@]} ))
do
  presets+="$list[$i]"
  alias "$list[$i]"="$list[$i+1] && {
    printf \"\e[1;15m%s\e[0m\n\" \"Syncing… $list[$i+2] -> $list[$i+3]\"
    rsync-synchronize -L --exclude='.*' $list[$i+2] $list[$i+3]
  }"
  i=$((i+4))
done
alias sync-all="${(j[;echo;])presets}"
