# Odd bits being reviewed or doesn't have a fitting home.

# compdef _gnu_generic foo
compdef fbrew=brew

alias lcut='/Applications/LosslessCut.app/Contents/MacOS/LosslessCut'

alias sync-emulation='rsync -avL --itemize-changes --delete ~/Games/Emulation /Volumes/980Pro'
alias sync-mame-storage='rsync -avL --itemize-changes --delete \
  ~/Games/Support/OpenEmu/AdvanceScan/_{unknown,import/_updates} /Volumes/Storage/Emulation/MAME'
alias sync-storage-remote='rsync -avzL --delete --progress -h \
  /Volumes/Storage/* dvessel-ds.local:/volume1/storage'
alias sync-all='sync-emulation && sync-mame-storage && sync-storage-remote'

if type bat &>/dev/null; then
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi
