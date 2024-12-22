#!/usr/bin/env zsh

# Odd bits being reviewed or doesn't have a fitting home.

# compdef _gnu_generic foo
if type brew &>/dev/null; then
  compdef fbrew=brew
fi
if type batman &>/dev/null; then
  compdef batman=man
fi
if ! type nvim &>/dev/null && test -f /opt/homebrew/bin/nvim; then
  alias nvim=/opt/homebrew/bin/nvim
fi
alias lcut='/Applications/LosslessCut.app/Contents/MacOS/LosslessCut'

alias dpnative2x1.6='displayplacer "id:1 mode:48"'
alias dpnative2x='displayplacer "id:1 mode:54"'
alias dpmore2x1.6='displayplacer "id:1 mode:66"'
alias dpmore2x-default='displayplacer "id:1 mode:72"'
alias dpnative1x='displayplacer "id:1 mode:126"'


alias sync-980-emulation='rsync -avL --itemize-changes --delete --exclude=.DS_Store \
  ~/Games/Emulation /Volumes/980Pro'
alias sync-storage-mame='rsync -avL --itemize-changes --delete --exclude=.DS_Store \
  ~/Games/Support/OpenEmu/AdvanceScan/_{unknown,import/_updates} /Volumes/Storage/Emulation/MAME'
alias sync-local='sync-980-emulation && sync-storage-mame'
alias sync-storage-to-remote='rsync -avzL --delete --progress -h --exclude=.DS_Store\
  /Volumes/Storage/* dvessel-ds.local:/volume1/storage'
alias sync-all='sync-local && sync-storage-to-remote'
