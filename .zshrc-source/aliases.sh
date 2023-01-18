#!/usr/bin/env zsh

alias ll='ls -lhGL'
alias la='ls -lhGA'
alias cl='clear'

alias vs='code'
alias vs.send='_fzf_paths_to code f'
alias sl='subl'
alias sl.send='_fzf_paths_to subl f'

alias hide='chflags hidden'
alias show='chflags nohidden'
alias hide.extension='SetFile -a E'
alias show.extension='SetFile -a e'
alias unquarantine='xattr -d com.apple.quarantine'

alias ql='qlmanage -p 1>/dev/null'

alias tag.list='tag -ctm "*" *(n)'
alias tag.usage='tag --usage -c ./'
alias tag.usage-all='tag --usage -c'

alias tm.excluded='mdfind "com_apple_backup_excludeItem = 'com.apple.backupd'"'

alias brew.tree='brew leaves | xargs brew deps --include-build --tree'

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
