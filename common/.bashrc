# ~/.bashrc

# Aliases
alias vim='nvim'

alias ls='ls --color=auto --group-directories-first'
alias ll='ls -l --color=auto --group-directories-first'
alias grep='grep --color=auto'

alias sv='source venv/bin/activate'
alias de='deactivate'

alias gs='git status'
alias ga='git add'
alias gc='git commit'

# Colors
white=$(tput setaf 255)
orange=$(tput setaf 214)

# Prompt
PS1='\[$white\]󱞩 \[$orange\]\W \[$white\]'
