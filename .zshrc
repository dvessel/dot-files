# Enable Powerlevel10k instant prompt.
p10k_cpath=~/.cache/p10k-instant-prompt-${(%):-%n}.zsh
[[ ! -f $p10k_cpath ]] || source $p10k_cpath

if type brew &>/dev/null; then
  export HOMEBREW_NO_ENV_HINTS=1

  # Formulae must be installed for both arm and x86.
  for p in `brew --prefix antidote`/share/antidote/antidote.zsh \
           `brew --prefix fzf`/shell/completion.zsh \
           `brew --prefix fzf`/shell/key-bindings.zsh; source $p

  fpath=(`brew --prefix`/share/zsh/site-functions $fpath)
fi

if type antidote &>/dev/null; then
  zstyle ':antidote:bundle' use-friendly-names 'yes'

  ANTIDOTE_HOME=~/.cache/antidote
  [[ -d $ANTIDOTE_HOME ]]     || touch ~/.zsh_plugins.txt
  [[ -f ~/.zsh_plugins.txt ]] || touch ~/.zsh_plugins.txt

  # Generate a new static file whenever .zsh_plugins.txt is updated.
  if [[ ~/.zsh_plugins.txt -nt ~/.zsh_plugins.zsh ]]; then
    antidote bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.zsh
  fi
  source ~/.zsh_plugins.zsh
else
  # Normally handled by antidote plugin:
  # - `mattmc3/zephyr path:plugins/completion`
  autoload -Uz compinit; compinit
fi

# Add local paths and prevent duplicates.
typeset -aU  path=(~/.local/{bin,zbin} $path)
typeset -aU fpath=(~/.local/zcompletions $fpath)

for p in ~/.zshrc-source/*.zsh; source $p
