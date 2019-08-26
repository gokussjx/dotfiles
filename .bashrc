#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Set default 'z' datafile
export _Z_DATA=/home/bidyut/.z

# Enable (forward) i-search. Disable current Ctrl+s terminal mapping
stty -ixon

# Default terminal text editor
export VISUAL="vim"

shopt -s histappend
PROMPT_COMMAND='history -a'
shopt -s checkwinsize
shopt -s cmdhist
shopt -s extglob
shopt -s dotglob

# don't put duplicate lines in the history. See bash(1) for more options
HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
HISTCONTROL=ignoreboth

# Expand the history size
HISTFILESIZE=10000 
HISTSIZE=100

# commands with leading space do not get added to history
HISTCONTROL=ignorespace

#export GREP_OPTIONS='--color=auto'

export LD_LIBRARY_PATH=/usr/local/lib

### ALIASES

## Keeping things organized
alias ls='ls -hF --color=auto'
alias ll='ls -l'
alias la='ls -A'
#alias rm='mv -t ~/.local/share/Trash/files'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p -v'
alias df='df -h'
alias rm='rm -iv'
alias du='du -h -c'
#alias reload='source ~/.bashrc'
#alias biggest='BLOCKSIZE=1048576; du -x | sort -nr | head -10'
alias tree='tree -Cs'

#Command substiution
#alias ff='sudo find / -name $1'
#alias df='df -h -x tmpfs -x usbfs'
#alias psg='ps -ef | grep $1'
#alias h='history | grep $1'
#alias rm='rm -i'
#alias cp='cp -i'
#alias mv='mv -i'
#alias which='type -all'
#alias ..='cd ..'
#alias path='echo -e ${PATH//:/\\n}'
#alias vi='vim'
#alias du='du -h --max-depth=1'

# More colored stuff
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
export LESS='-R '

# Colored man pages
#man() {
#		LESS_TERMCAP_md=$'\e[1;36m' \
#		LESS_TERMCAP_me=$'\e[0m' \
#		LESS_TERMCAP_se=$'\e[0m' \
#		LESS_TERMCAP_so=$'\e[1;40;92m' \
#		LESS_TERMCAP_ue=$'\e[0m' \
#		LESS_TERMCAP_us=$'\e[1;32m' \
#		command	man "$@"
#}
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

# This is GOLD for finding out what is taking so much space on your drives!
alias diskspace="du -S | sort -n -r |more"

## Moving around & all that jazz
alias back='cd $OLDPWD'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# AWS Lab-4
#export JAVA_HOME="/usr/lib/jvm/java-7-openjdk/"
#export AWS_AUTO_SCALING_HOME="/opt/tools/AutoScaling-1.0.61.6/"	
#export PATH="${AWS_AUTO_SCALING_HOME}/bin:$PATH"
#export AWS_CREDENTIAL_FILE="/opt/tools/AutoScaling-1.0.61.6/credential-file-path"

fe() {
  local files
  IFS=$'\n' files=($(fzf --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

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

# For Bash, add the following to the bottom of ~/.bash_profile. If the file does not exist, copy a skeleton version from /etc/skel/.bash_profile. For Zsh, add it to ~/.zprofile.
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

# SSH Agent
eval `ssh-agent -s`
ssh-add /home/bidyut/.ssh/id_digital_ocean
ssh-add ~/.ssh/id_github
clear && clear

# GENI stuff
#alias sshg='ssh -i /home/bidyut/.ssh/id_geni_ssh_rsa'
#alias scpg='scp -i /home/bidyut/.ssh/id_geni_ssh_rsa'

# INFO
# grc {STDOUT commands} {log/file} : Colored log output
# https://github.com/pengwynn/grc

archey3
fortune

