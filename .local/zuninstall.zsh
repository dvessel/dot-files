#!/usr/bin/env zsh

print "Uninstalling homebrew.sh…"

fbrew uninstall --cask

if /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
then
  __delete=( ~/.zsh_plugins.zsh ~/.cache/{antidote,gitstatus,p10k-*,zsh}(N) )
  print "Cleaning up…"
  printf "%s\n" $__delete
  rm -fr $__delete
  unset __delete
fi
