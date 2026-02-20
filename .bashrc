# ~/.bashrc
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='ls --color=auto --group-directories-first'
alias ll='ls -l --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias tree='tree -L 2'
alias sv='source venv/bin/activate'
alias de='deactivate'

# Colors
white=$(tput setaf 255)
orange=$(tput setaf 214)

PS1='\[$white\]󱞩 \[$orange\]\W \[$white\]'
