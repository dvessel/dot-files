# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
p10k_cpath=~/.cache/p10k-instant-prompt-${(%):-%n}.zsh
[ ! -f $p10k_cpath ] || source $p10k_cpath

# Prevent duplicate paths.
typeset -aU path; path+=~/.local/bin

for p in ~/.zshrc-source/*.zsh; source $p

if type brew &>/dev/null; then
  export HOMEBREW_NO_ENV_HINTS=1

  # Formulae must be installed for both arm and x86.
  for p in `brew --prefix antidote`/share/antidote/antidote.zsh \
           `brew --prefix fzf`/shell/completion.zsh \
           `brew --prefix fzf`/shell/key-bindings.zsh; source $p

  fpath+=`brew --prefix`/share/zsh/site-functions
  # autoload -Uz compinit; compinit
  # `compinit` handled by antidote:`mattmc3/zephyr path:plugins/completion`.
fi

if type antidote &>/dev/null; then
  # @see ~/.zsh_plugins.txt for loaded plugins.
  zstyle ':antidote:bundle' use-friendly-names 'yes'
  antidote load

  # zsh-users/zsh-history-substring-search
  for k in '^[[A' '^P'; bindkey $k history-substring-search-up
  for k in '^[[B' '^N'; bindkey $k history-substring-search-down
  HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
  HISTORY_SUBSTRING_SEARCH_FUZZY=1
fi
