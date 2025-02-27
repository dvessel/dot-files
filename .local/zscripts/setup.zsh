#!/usr/bin/env zsh

if ! test -f $HOME/Library/Keybindings/DefaultKeyBinding.dict; then
  print "Hard linking DefaultKeyBinding.dict to ~/Library/KeyBindings."
  mkdir -p $HOME/Library/KeyBindings
  ln ${XDG_CONFIG_HOME:-$HOME/.config}/KeyBindings/DefaultKeyBinding.dict $HOME/Library/KeyBindings/
fi

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
  source $ZDOTDIR/.zprofile
  print "Ignore brew setup instructions. Homebrew \$PATH already set in .zprofile."
  print "Installing brew basic-setup…"
  brew bundle --no-lock --file ${XDG_CONFIG_HOME:-$HOME/.config}/brew/basic-setup
fi
unset __brew_path
