# Odd bits being reviewed or doesn't have a fitting home.

alias lcut='/Applications/LosslessCut.app/Contents/MacOS/LosslessCut'

if type bat &>/dev/null; then
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

# Shim for `extract` ohmyzsh plugin to unrar through p7zip.
if ! type unrar &>/dev/null && type 7z &>/dev/null; then
  function unrar { 7z $@ }
fi
