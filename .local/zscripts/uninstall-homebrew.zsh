#!/usr/bin/env zsh

printf "\e[0;31m%s\e[0m" "WARNING! "
read -q "REPLY?Do you want to uninstall homebrew.sh? (y/n): " || return 1
printf "\n\e[1;30m%s\e[0m\n" "Uninstalling homebrew.sh…"

if /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
then
  __delete=( ~/.cache/{antidote,gitstatus,p10k-*,zsh}(N) )
  printf "\n\e[1;30m%s\e[0m\n" "Cleaning up…"
  printf "%s\n" $__delete
  rm -fr $__delete
  unset __delete
fi
