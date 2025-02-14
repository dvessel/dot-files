#!/usr/bin/env zsh

alias rsync-copy='rsync -avz --progress -h --exclude=.DS_Store'
alias rsync-move='rsync -avz --progress -h --remove-source-files --exclude=.DS_Store'
alias rsync-update='rsync -avzu --progress -h --itemize-changes --exclude=.DS_Store'
alias rsync-synchronize='rsync -avzu --delete --progress -h --itemize-changes --exclude=.DS_Store'

alias rsync-emulation::980pro='rsync-synchronize -L \
  ~/Games/Emulation \
  /Volumes/980Pro'
alias rsync-advancescan::storage:emulation:mame='rsync-synchronize -L \
  ~/Games/Support/OpenEmu/AdvanceScan/_{unknown,import/_updates} \
  /Volumes/Storage/Emulation/MAME'
alias rsync-storage::dvessel-ds.local:storage='rsync-synchronize -L \
  /Volumes/Storage/* \
  dvessel-ds.local:/volume1/storage'

__rsync_presets=(
  'test -d /Volumes/980Pro'
  rsync-emulation::980pro
  'test -d /Volumes/Storage'
  rsync-advancescan::storage:emulation:mame
  'ping -c1 dvessel-ds.local &>/dev/null'
  rsync-storage::dvessel-ds.local:storage
)
alias rsync-all="${(j[ && ])__rsync_presets}"
unset __rsync_presets
