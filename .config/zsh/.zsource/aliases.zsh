#!/usr/bin/env zsh

# Tripple dash appended to a command will pipe to a pager.
if test -f /opt/homebrew/bin/bat; then
  alias -g -- ---='2>&1 | /opt/homebrew/bin/bat --plain'
else
  alias -g -- ---='2>&1 | less'
fi

if type lsd &>/dev/null; then
  alias l='lsd'
  alias a='lsd -A'
  alias l.='lsd -d .*'
  alias ll='lsd --blocks permission,user,group,links,date,name --size short --dereference'
  alias la='ll -A'
  alias lt='lsd --tree --size short'
  alias gl='lsd --blocks git,date,links,name -AG'
  alias sl='lsd --blocks permission,user,group,size,date,name -S --total-size'
  alias tl='ll --date relative -t'
else
  alias l='ls --color=auto'
  alias a='ls -A --color=auto'
  alias l.='ls -d --color=auto .*'
  alias ll='ls -l --color=auto'
  alias la='ls -lA --color=auto'
fi

alias d='pwd'
alias dh='cd +${$(dirs -v | fzf | cut -f1):-0}'
alias ho='cd $HOME'
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
alias zcc='rm -rf $XDG_CACHE_HOME/zsh && echo zsh\ caches\ cleared.'

# Make neovim & neovide available in x86 Rosetta.
if ! type nvim &>/dev/null && test -f /opt/homebrew/bin/nvim; then
  alias nvim=/opt/homebrew/bin/nvim
fi
if ! type neovide &>/dev/null && test -f /opt/homebrew/bin/neovide; then
  alias neovide='/opt/homebrew/bin/neovide'
fi

# Install brew and all dependent plugins.
if ! type brew &>/dev/null; then
  alias initial-setup='~/.local/zscripts/setup.zsh'
fi
