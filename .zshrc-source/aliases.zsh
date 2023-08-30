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

# Use `exit` to undo the switch.
alias switch.x86='arch -d PATH --x86_64 /bin/zsh -l'
alias switch.arm='arch -d PATH --arm64 /bin/zsh -l'

alias sync.emulation='rsync -avL --itemize-changes --delete \
  ~/Games/Emulation /Volumes/980Pro'
alias sync.storage='rsync -avzL --delete --progress -h \
  /Volumes/Storage/* dvessel-ds.local:/volume1/storage'
alias sync.all='sync.emulation && sync.storage'

alias hex2decimal='printf "%d\n"'
alias decimal2hex='printf "0x0%x\n"'

alias capture.fullscreen='screencapture -vpdR 0,0,1728,1117 \
  -G com.rogueamoeba.Loopback:4699A16B-2B90-4A3F-B522-B2CFFAC463FA'
alias capture.no-menu='screencapture -vpdR 0,37,1728,1080 \
  -G com.rogueamoeba.Loopback:4699A16B-2B90-4A3F-B522-B2CFFAC463FA'
alias capture.4/3-center='screencapture -vpdR 144,37,1440,1080 \
  -G com.rogueamoeba.Loopback:4699A16B-2B90-4A3F-B522-B2CFFAC463FA'
alias capture.left='screencapture -vpdR 0,37,864,1080 \
  -G com.rogueamoeba.Loopback:4699A16B-2B90-4A3F-B522-B2CFFAC463FA'
alias capture.right='screencapture -vpdR 864,37,864,1080 \
  -G com.rogueamoeba.Loopback:4699A16B-2B90-4A3F-B522-B2CFFAC463FA'
alias capture.3/4-left='screencapture -vpdR 27,37,810,1080 \
  -G com.rogueamoeba.Loopback:4699A16B-2B90-4A3F-B522-B2CFFAC463FA'
alias capture.3/4-center='screencapture -vpdR 459,37,810,1080 \
  -G com.rogueamoeba.Loopback:4699A16B-2B90-4A3F-B522-B2CFFAC463FA'
alias capture.3/4-right='screencapture -vpdR 891,37,810,1080 \
  -G com.rogueamoeba.Loopback:4699A16B-2B90-4A3F-B522-B2CFFAC463FA'
