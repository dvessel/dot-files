# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
p10k_cpath=~/.cache/p10k-instant-prompt-${(%):-%n}.zsh
[ ! -f $p10k_cpath ] || source $p10k_cpath

# Prevent duplicate paths.
typeset -aU path; path+=~/.local/bin

for zs in ~/.zshrc-source/*.zsh; [ ! -f $zs ] || source $zs

if type brew &>/dev/null; then
  export HOMEBREW_NO_ENV_HINTS=1
  # Homebrew managed shell completions: https://docs.brew.sh/Shell-Completion
  fpath+=`brew --prefix`/share/zsh/site-functions
  # autoload -Uz compinit; compinit
  # `compinit` handled by antidote plugin:`belak/zsh-utils path:completion`.
fi

if type antidote &>/dev/null; then
  # @see ~/.zsh_plugins.txt for loaded plugins.
  zstyle ':antidote:bundle' use-friendly-names 'yes'
  antidote load
fi
