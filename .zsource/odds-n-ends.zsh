#!/usr/bin/env zsh

# Odd bits being reviewed or doesn't have a fitting home.

if ! type nvim &>/dev/null && test -f /opt/homebrew/bin/nvim; then
  alias nvim=/opt/homebrew/bin/nvim
fi
alias lcut='/Applications/LosslessCut.app/Contents/MacOS/LosslessCut'

if _brew_check -s displayplacer; then

  alias dpmore:120hz='displayplacer     "id:1 mode:72"'
  alias dpmore:60hz='displayplacer      "id:1 mode:73"'
  alias dpmore:59.94hz='displayplacer   "id:1 mode:74"'
  alias dpmore:50hz='displayplacer      "id:1 mode:75"'
  alias dpmore:48hz='displayplacer      "id:1 mode:76"'

  alias dpmore-notchless:120hz='displayplacer     "id:1 mode:66"'
  alias dpmore-notchless:60hz='displayplacer      "id:1 mode:67"'
  alias dpmore-notchless:59.94hz='displayplacer   "id:1 mode:68"'
  alias dpmore-notchless:50hz='displayplacer      "id:1 mode:69"'
  alias dpmore-notchless:48hz='displayplacer      "id:1 mode:70"'

  alias dpnative:120hz='displayplacer   "id:1 mode:54"'
  alias dpnative:60hz='displayplacer    "id:1 mode:55"'
  alias dpnative:59.94hz='displayplacer "id:1 mode:56"'
  alias dpnative:50hz='displayplacer    "id:1 mode:57"'
  alias dpnative:48hz='displayplacer    "id:1 mode:58"'

  alias dpnative-notchless:120hz='displayplacer   "id:1 mode:48"'
  alias dpnative-notchless:60hz='displayplacer    "id:1 mode:49"'
  alias dpnative-notchless:59.94hz='displayplacer "id:1 mode:50"'
  alias dpnative-notchless:50hz='displayplacer    "id:1 mode:51"'
  alias dpnative-notchless:48hz='displayplacer    "id:1 mode:52"'

fi

alias sync-980-emulation='rsync -avL --itemize-changes --delete --exclude=.DS_Store \
  ~/Games/Emulation /Volumes/980Pro'
alias sync-storage-mame='rsync -avL --itemize-changes --delete --exclude=.DS_Store \
  ~/Games/Support/OpenEmu/AdvanceScan/_{unknown,import/_updates} /Volumes/Storage/Emulation/MAME'
alias sync-local='sync-980-emulation && sync-storage-mame'
alias sync-storage-to-remote='rsync -avzL --delete --progress -h --exclude=.DS_Store\
  /Volumes/Storage/* dvessel-ds.local:/volume1/storage'
alias sync-all='sync-local && sync-storage-to-remote'
