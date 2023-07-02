if [[ `sysctl -n sysctl.proc_translated` == 0 ]]; then
  # Native ARM homebrew.
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  # Translated x86 homebrew.
  eval "$(/usr/local/bin/brew shellenv)"
fi
