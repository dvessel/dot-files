#!/usr/bin/env zsh

print "Installing homebrew.sh…"
case `sysctl -n sysctl.proc_translated` in
  0) __brew_path=/opt/homebrew/bin/brew ;;
  1) __brew_path=/usr/local/bin/brew ;;
esac
if ! -f $__brew_path \
&& /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
then
  print "Installing brew basic-setup…"
  brew tap homebrew/bundle
  brew bundle --file ~/.config/brew/basic-setup
fi
unset __brew_path
