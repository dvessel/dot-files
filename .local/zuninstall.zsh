#!/usr/bin/env zsh

print "Uninstalling homebrew.sh…"

if /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
then
  __caches=( ~/.cache/{antidote,gitstatus,p10k-*,zsh}(N) )
  print "Removing caches…"
  printf "%s\n" $__caches
  rm -fr $__caches
  unset __caches
fi
