# Use oh-my-zsh
ZSH=/usr/share/oh-my-zsh

# Export default user
export DEFAULT_USER="bidyut"

# Enable colors
export TERM="xterm-256color"

# Set default 'z' datafile
export _Z_DATA=/home/bidyut/.z

# Ported from Bash
export VISUAL="vim"
# Don't put duplicate lines in the history. See bash(1) for more options
HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
HISTCONTROL=ignoreboth
# Commands with leading space do not get added to history
HISTCONTROL=ignorespace

export LD_LIBRARY_PATH=/usr/local/lib

# Java 8
#export JAVA_HOME="/usr/lib/jvm/java-8-jdk/"
export JAVA_HOME="/usr/lib/jvm/default"

# GoLang
#export GOPATH=~/go
#export PATH=$PATH:~/go/bin

# Flutter
#export PATH=/home/bidyut/Downloads/Flutter/flutter/bin:$PATH

# fzf include hidden files
export FZF_DEFAULT_COMMAND='find .'

# SSH Agent
#eval `ssh-agent -s`
#ssh-add /home/bidyut/.ssh/id_digital_ocean
#ssh-add ~/.ssh/id_github
#clear && clear
#

export ZSH=/usr/share/oh-my-zsh

# Use zsh-syntax-highlighting
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Enable a few plugins through oh-my-zsh
plugins=(
    archlinux
    colored-man-pages
    vscode
    web-search
    colorize
    command-not-found
    sudo
    zsh-syntax-highlighting
    zsh-autosuggestions
    history-substring-search
    zsh-interactive-cd
)

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
#bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/bidyut/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Autocompletion of command line switches for aliases
setopt COMPLETE_ALIASES

# Autocompletion of privileged environments in privileged commands
zstyle ':completion::complete:*' gain-privileges 1

# Rehashing using pacman hook
zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}

add-zsh-hook -Uz precmd rehash_precmd

# Bullet-train theme
ZSH_THEME="bullet-train"

BULLETTRAIN_PROMPT_ORDER=(
  git
  context
  dir
  time
)

archey3
fortune

source $ZSH/oh-my-zsh.sh

# More aliases
alias ls='ls -hF --color=auto'
alias cp='cp -i' 
alias mv='mv -i'
alias mkdir='mkdir -p -v'
alias df='df -h'
alias rm='rm -iv'
alias du='du -h -c'

# This is GOLD for finding out what is taking so much space on your drives!
alias diskspace="du -S | sort -n -r | more"

# Source fzf stuff
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/fzf-extras.zsh

# Key bindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
bindkey '^ ' autosuggest-accept
