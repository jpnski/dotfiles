# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias grep='grep --color=auto'

# Colors
white=$(tput setaf 255)
orange=$(tput setaf 214)

PS1='\[$white\]󱞩 \[$orange\]\W \[$white\]'
