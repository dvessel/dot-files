alias ll='lsd -lL'
alias la='lsd -lA'
alias lt='lsd --tree'
alias cl='clear'

alias ..='builtin cd $OLDPWD'

alias lb='open -b at.obdev.LaunchBar'
alias ql='qlmanage -p &>/dev/null'

alias vs='code'
alias st='subl'

alias hide='chflags hidden'
alias show='chflags nohidden'
alias hide.ext='SetFile -a E'
alias show.ext='SetFile -a e'

alias unquarantine='xattr -d com.apple.quarantine'

alias sync.emulation='rsync -avL --itemize-changes --delete \
  ~/Games/Emulation /Volumes/980Pro'
alias sync.storage.local='rsync -avL --itemize-changes --delete \
  ~/Games/Support/OpenEmu/AdvanceScan/_{unknown,import/_updates} /Volumes/Storage/Emulation/MAME'
alias sync.storage.remote='rsync -avzL --delete --progress -h \
  /Volumes/Storage/* dvessel-ds.local:/volume1/storage'
alias sync.all='sync.emulation && sync.storage.local && sync.storage.remote'

alias hex2decimal='printf "%d\n"'
alias decimal2hex='printf "0x0%x\n"'
