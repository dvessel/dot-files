#!/usr/bin/env zsh

# Odd bits being reviewed or doesn't have a fitting home.

# compdef _gnu_generic foo
if type brew &>/dev/null; then
  compdef fbrew=brew
fi
if ! type nvim &>/dev/null && test -f /opt/homebrew/bin/nvim; then
  alias nvim=/opt/homebrew/bin/nvim
fi
alias lcut='/Applications/LosslessCut.app/Contents/MacOS/LosslessCut'

alias sync-emulation='rsync -avL --itemize-changes --delete --exclude=.DS_Store \
  ~/Games/Emulation /Volumes/980Pro'
alias sync-mame-storage='rsync -avL --itemize-changes --delete --exclude=.DS_Store \
  ~/Games/Support/OpenEmu/AdvanceScan/_{unknown,import/_updates} /Volumes/Storage/Emulation/MAME'
alias sync-storage-remote='rsync -avzL --delete --progress -h --exclude=.DS_Store\
  /Volumes/Storage/* dvessel-ds.local:/volume1/storage'
alias sync-all='sync-emulation && sync-mame-storage && sync-storage-remote'
