#!/usr/bin/env zsh

if type lsd &>/dev/null; then
  alias l='lsd'
  alias a='lsd -A'
  alias l.='lsd -d .*'
  alias ll='lsd -l  --blocks permission,date,name --dereference'
  alias la='lsd -lA --blocks permission,date,name'
  alias lt='lsd --blocks size,date,git,name --size short --date "+%l:%M %p %D" --tree'
  alias gl='lsd -A --blocks git,date,links,name --date relative --gitsort --reverse'
  alias ml='lsd --blocks permission,user,group,links,name'
  alias sl='lsd --blocks size,links,name --total-size --sizesort'
  alias tl='lsd --blocks date,links,name --date relative --timesort'
  alias -g -- ---='2>&1 --color=always --icon=always | less -F'
else
  alias l='ls --color=auto'
  alias a='ls -A --color=auto'
  alias l.='ls -d --color=auto .*'
  alias ll='ls -l --color=auto'
  alias la='ls -lA --color=auto'
  alias -g -- ---='2>&1 --color=always | less -F'
fi

alias d='pwd'
alias dh='cd +${$(dirs -v | fzf | cut -f1):-0}'
for i ({1..9}) alias "$i"="cd +$i"

alias cl='/usr/bin/clear -x'
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

# Clear zsh related caches.
alias zcc='rm -rf ${XDG_CACHE_HOME:-~/.cache}/zsh && echo zsh\ caches\ cleared.'

# Make neovim available in x86 Rosetta.
if ! type nvim &>/dev/null && test -f /opt/homebrew/bin/nvim; then
  alias nvim=/opt/homebrew/bin/nvim
fi

# Install brew and all dependent plugins.
if ! type brew &>/dev/null; then
  alias initial-setup='~/.local/zsetup.zsh'
fi
