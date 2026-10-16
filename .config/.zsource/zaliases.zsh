#!/usr/bin/env zsh

# Tripple dash appended to a command will pipe to a pager.
if (( $+commands[bat] ))
then alias -g -- ---='2>&1 | bat --plain'
else alias -g -- ---='2>&1 | less'
fi

if (( $+commands[eza] ))
then
  alias l='eza --no-quotes --icons --hyperlink'
  alias a='l -a'
  alias a.='(){ a -d ${1:-$PWD}/.*(:t) }'
  alias ll='l -l --time-style "+%D %l:%M%p" --links --dereference'
  alias la='a -l --time-style "+%D %l:%M%p" --links'
  alias la.='(){ la -d ${1:-$PWD}/.*(:t) }'
  alias lt='l --tree'
  alias gi='ll --git --git-repos --git-ignore -aa'
  alias gl='ll --git --git-repos'
  alias sl='ll --total-size --sort size --reverse'
  alias tl='ll --time-style relative --sort modified --reverse'
else
  alias l='ls --color=auto'
  alias a='ls -A --color=auto'
  alias a.='(){ a -d ${1:-$PWD}/.*(:t) }'
  alias ll='ls -l --color=auto'
  alias la='ls -lA --color=auto'
  alias la.='(){ la -d ${1:-$PWD}/.*(:t) }'
fi

alias d='pwd'
alias dh='cd-history'
alias dp='cd-projects'
alias ho='cd $HOME'
for i ({1..3}) alias "$i"="cd +$i"

alias lb='open -b at.obdev.LaunchBar'
alias lg='lazygit'
alias ql='qlmanage -p &>/dev/null'
alias nv='nvim'
alias ni='neovide'
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
if [[ -z $commands[brew] ]]
then alias initial-setup='~/.local/zscripts/setup.zsh'
fi
