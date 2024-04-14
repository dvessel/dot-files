alias ll='lsd -l'
alias la='lsd -lA'
alias lt='lsd --tree'
alias tl='lsd --blocks=date,name --date=relative --sort=time'
alias sl='lsd --blocks=size,name --total-size --size=default --sort=size'
alias ml='lsd --blocks=permission,user,group,name'
alias tsl='lsd --blocks=date,size,name --date=relative --total-size --sort=time'
alias stl='lsd --blocks=size,date,name --total-size --date=relative --sort=size'
alias cl='clear'

alias lb='open -b at.obdev.LaunchBar'
alias ql='qlmanage -p &>/dev/null'

alias vs='code'
alias zz='zed'

alias hide='chflags hidden'
alias show='chflags nohidden'
alias hide-ext='SetFile -a E'
alias show-ext='SetFile -a e'

alias unquarantine='xattr -d com.apple.quarantine'

alias hex2decimal='printf "%d\n"'
alias decimal2hex='printf "0x0%x\n"'

alias rsync-copy="rsync -avz --progress -h"
alias rsync-move="rsync -avz --progress -h --remove-source-files"
alias rsync-update="rsync -avzu --progress -h"
alias rsync-synchronize="rsync -avzu --delete --progress -h"

alias sync-emulation='rsync -avL --itemize-changes --delete ~/Games/Emulation /Volumes/980Pro'
alias sync-mame-storage='rsync -avL --itemize-changes --delete \
  ~/Games/Support/OpenEmu/AdvanceScan/_{unknown,import/_updates} /Volumes/Storage/Emulation/MAME'
alias sync-storage-remote='rsync -avzL --delete --progress -h \
  /Volumes/Storage/* dvessel-ds.local:/volume1/storage'
alias sync-all='sync-emulation && sync-mame-storage && sync-storage-remote'
