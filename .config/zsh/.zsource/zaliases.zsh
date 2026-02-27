#!/usr/bin/env zsh

# Tripple dash appended to a command will pipe to a pager.
if test -f /opt/homebrew/bin/bat; then
  alias -g -- ---='2>&1 | /opt/homebrew/bin/bat --plain'
else
  alias -g -- ---='2>&1 | less'
fi

if type eza &>/dev/null; then
  alias l='eza --no-quotes --icons --hyperlink'
  alias a='l -a'
  alias l.='l -d .*'
  alias ll='l -lh --time-style "+%D %l:%M%p" --links --dereference'
  alias la='a -lh --time-style "+%D %l:%M%p" --links'
  alias lt='l --tree'
  alias gi='ll --git --git-repos --git-ignore -aa'
  alias gl='ll --git --git-repos'
  alias sl='ll --total-size --sort size --reverse'
  alias tl='ll --time-style relative --sort modified --reverse'
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
for i ({1..5}) alias "$i"="cd +$i"

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

# Install brew and all dependent plugins.
if ! type brew &>/dev/null; then
  alias initial-setup='~/.local/zscripts/setup.zsh'
fi
