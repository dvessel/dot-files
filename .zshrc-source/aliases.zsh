alias ll='lsd -lL'
alias la='lsd -lA'
alias lt='lsd --tree'
alias cl='clear'

alias vs='code'
alias vs.select='_fzf_send_paths_to code'
alias st='subl'
alias st.select='_fzf_send_paths_to subl'

alias hide='chflags hidden'
alias show='chflags nohidden'
alias hide.extension='SetFile -a E'
alias show.extension='SetFile -a e'
alias unquarantine='xattr -d com.apple.quarantine'

# Use `exit` to undo the switch.
alias switch.x86='arch -d PATH --x86_64 /bin/zsh -l'
alias switch.arm='arch -d PATH --arm64 /bin/zsh -l'

alias ql='qlmanage -p 2>/dev/null'

alias tag.list='tag -ctm "*" *(n)'
alias tag.usage='tag --usage -c ./'
alias tag.usage-all='tag --usage -c'

alias brew.tree='brew leaves | xargs brew deps --include-build --tree'

alias sync.emulation='rsync -avL --itemize-changes --delete ~/Games/Emulation /Volumes/980Pro'
alias sync.storage='rsync -avzL --itemize-changes --delete /Volumes/Storage/* dvessel-ds.local:/volume1/storage'
alias sync.all='sync.emulation && sync.storage'

alias hex2decimal='printf "%d\n"'
alias decimal2hex='printf "0x0%x\n"'

alias metal-hud.enable='launchctl setenv MTL_HUD_ENABLED 1'
alias metal-hud.disable='launchctl setenv MTL_HUD_ENABLED 0'

alias capture.3/4-left='screencapture -vpdR 29,43,964.5,1286 \
  -G com.rogueamoeba.Loopback:4699A16B-2B90-4A3F-B522-B2CFFAC463FA'
alias capture.3/4-center='screencapture -vpdR 546,43,964.5,1286 \
  -G com.rogueamoeba.Loopback:4699A16B-2B90-4A3F-B522-B2CFFAC463FA'
alias capture.3/4-right='screencapture -vpdR 1063,43,964.5,1286 \
  -G com.rogueamoeba.Loopback:4699A16B-2B90-4A3F-B522-B2CFFAC463FA'
alias capture.4/3-center='screencapture -vpdR 171,43,1715,1286 \
  -G com.rogueamoeba.Loopback:4699A16B-2B90-4A3F-B522-B2CFFAC463FA'
alias capture.no-menu='screencapture -vpdR 0,43,2056,1286 \
  -G com.rogueamoeba.Loopback:4699A16B-2B90-4A3F-B522-B2CFFAC463FA'
alias capture.left='screencapture -vpdR 0,43,1028,1286 \
  -G com.rogueamoeba.Loopback:4699A16B-2B90-4A3F-B522-B2CFFAC463FA'
alias capture.right='screencapture -vpdR 1029,43,2056,1286 \
  -G com.rogueamoeba.Loopback:4699A16B-2B90-4A3F-B522-B2CFFAC463FA'
