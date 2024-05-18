#!/usr/bin/env zsh

case `sysctl -n sysctl.proc_translated` in
  0) __brew_path=/opt/homebrew/bin/brew ;;
  1) __brew_path=/usr/local/bin/brew ;;
esac

if ! test -f $__brew_path; then
  print "Installing homebrew.sh…"
else
  print "homebrew is already installed." >&2
  return 1
fi

if /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
then
  source ~/.zprofile
  print "Installing brew basic-setup…"
  brew tap homebrew/bundle
  brew bundle --no-lock --file ~/.config/brew/basic-setup
fi
unset __brew_path
