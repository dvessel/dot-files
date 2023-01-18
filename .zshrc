#!/usr/bin/env zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
p10k_cpath="${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
[ ! -f $p10k_cpath ] || source $p10k_cpath

# Source zinit. It's available in homebrew but it's not officially supported.
# Install manually: https://github.com/zdharma-continuum/zinit
zinit_home="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"
[ ! -f $zinit_home/zinit.zsh ] || source $zinit_home/zinit.zsh

if type brew &>/dev/null; then

  # Homebrew managed shell completions: https://docs.brew.sh/Shell-Completion
  fpath+=`brew --prefix`/share/zsh/site-functions

  # zsh-completions: https://github.com/zsh-users/zsh-completions
  fpath+=`brew --prefix`/share/zsh-completions

  # Auto completion. Set after fpath.
  autoload -Uz compinit; compinit

  source `brew --prefix`/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  source `brew --prefix`/opt/git-extras/share/git-extras/git-extras-completion.zsh

fi

if type zinit &>/dev/null; then

  # https://github.com/romkatv/powerlevel10k
  zinit ice depth"1"; zinit light romkatv/powerlevel10k
  # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
  [ ! -f $HOME/.p10k.zsh ] || source $HOME/.p10k.zsh

  # https://github.com/Aloxaf/fzf-tab
  # NOTE: fzf-tab needs to be loaded after compinit, but before plugins which
  # will wrap widgets, such as zsh-autosuggestions or fast-syntax-highlighting!!
  zinit ice depth"1"; zinit light Aloxaf/fzf-tab

  # https://github.com/zdharma-continuum/fast-syntax-highlighting
  zinit ice depth"1"; zinit light zdharma-continuum/fast-syntax-highlighting

  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins
  zinit snippet OMZ::plugins/extract
  zinit snippet OMZ::plugins/fancy-ctrl-z
  zinit snippet OMZ::plugins/transfer
  zinit snippet OMZ::plugins/universalarchive

  # https://github.com/zdharma-continuum/zinit-packages

fi

# Shows all paths with `/usr/libexec/path_helper`.
path+=$HOME/.local/bin
export path

# Editors
editor='code -w'
git_editor='code -w'

# Case insensitive autocomplete and globbing.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
setopt no_case_glob

export HISTSIZE=100000
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt share_history

for sh in `find $HOME/.zshrc-source -name '*.sh'`; source $sh
