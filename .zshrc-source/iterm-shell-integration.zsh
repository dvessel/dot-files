if [[ $LC_TERMINAL == iTerm2 ]]; then
  bundlepath=`lsappinfo info -only bundlepath iTerm2 | sed 's/".*"="\(.*\)"/\1/'`
  source "$bundlepath/Contents/Resources/iterm2_shell_integration.zsh"
  unset bundlepath
  # https://iterm2.com/3.3/documentation-variables.html
  # https://iterm2.com/3.3/documentation-scripting-fundamentals.html
  function iterm2_print_user_vars {
    iterm2_set_user_var machine `machine`
  }
fi
