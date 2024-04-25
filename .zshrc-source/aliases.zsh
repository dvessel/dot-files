alias -g ll='lsd -l'
alias -g la='lsd -lA'
alias -g lt='lsd --tree'
alias -g tl='lsd --blocks=date,name --date=relative --sort=time'
alias -g sl='lsd --blocks=size,name --total-size --size=default --sort=size'
alias -g ml='lsd --blocks=permission,user,group,name'
alias -g tsl='lsd --blocks=date,size,name --date=relative --total-size --sort=time'
alias -g stl='lsd --blocks=size,date,name --total-size --date=relative --sort=size'
alias -g cl='/usr/bin/clear'
alias -g cx='/usr/bin/clear -x'

alias d='pwd'
alias h='ls -d --color=auto .*'

alias bp='batpipe'
alias lb='open -b at.obdev.LaunchBar'
alias ql='qlmanage -p &>/dev/null'

alias vs='code'
alias zd='zed'

alias man='batman'

alias hide='chflags hidden'
alias show='chflags nohidden'
alias hide-ext='SetFile -a E'
alias show-ext='SetFile -a e'

alias unquarantine='xattr -d com.apple.quarantine'

alias hex2decimal='printf "%d\n"'
alias decimal2hex='printf "0x0%x\n"'

alias rsync-copy='rsync -avz --progress -h --exclude=.DS_Store'
alias rsync-move='rsync -avz --progress -h --remove-source-files --exclude=.DS_Store'
alias rsync-update='rsync -avzu --progress -h --exclude=.DS_Store'
alias rsync-synchronize='rsync -avzu --delete --progress -h --exclude=.DS_Store'
