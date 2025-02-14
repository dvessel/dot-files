#!/usr/bin/env zsh

if _brew_check -s lsd; then
  alias l='lsd'
  alias a='lsd -A'
  alias .='lsd -d .*'
  alias ll='lsd -l'
  alias la='lsd -lA'
  alias lt='lsd --tree'
  alias tl='lsd --blocks=date,name --date=relative --sort=time'
  alias sl='lsd --blocks=size,name --total-size --size=default --sort=size'
  alias ml='lsd --blocks=permission,user,group,name'
else
  alias l='ls --color=auto'
  alias a='ls -A --color=auto'
  alias .='ls -d --color=auto .*'
  alias ll='ls -l --color=auto'
  alias la='ls -lA --color=auto'
fi

alias d='pwd'
alias dh='cd +${$(dirs -v | fzf | cut -f1):-0}'
for i ({1..9}) alias "$i"="cd +$i"

alias cl='/usr/bin/clear -x'

if _brew_check -s bat-extras; then
  alias bdiff='batdiff'
  alias bgrep='batgrep'
  alias bpipe='batpipe'
  alias bwatch='batwatch'
  alias man='batman'
fi

alias lb='open -b at.obdev.LaunchBar'
alias ql='qlmanage -p &>/dev/null'
alias vs='codium'

alias hide='chflags hidden'
alias show='chflags nohidden'
alias hide-ext='SetFile -a E'
alias show-ext='SetFile -a e'

alias unquarantine='xattr -r -d com.apple.quarantine'

alias hex2decimal='printf "%d\n"'
alias decimal2hex='printf "0x0%x\n"'

alias rsync-copy='rsync -avz --progress -h --exclude=.DS_Store'
alias rsync-move='rsync -avz --progress -h --remove-source-files --exclude=.DS_Store'
alias rsync-update='rsync -avzu --progress -h --exclude=.DS_Store'
alias rsync-synchronize='rsync -avzu --delete --progress -h --exclude=.DS_Store'

# Clear completions cache.
alias zcc='rm -rf ~/{.cache/zsh,.zcompcache} && echo zcompcache\ cleared.'

# Install brew and all dependent plugins.
if ! type brew &>/dev/null; then
  alias initial-setup='~/.local/zsetup.zsh'
fi
