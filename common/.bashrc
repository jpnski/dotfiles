######################## Settings ########################

# Don't load ~/.bashdc if not interactive
case $- in
    *i*) ;;
    *) return;;
esac

# Load global configuration
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Use bash_aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Enable bash completion in interactive shells
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# Bash history
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# GCC colored warnings/errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Colors inside tmux
export TERM=xterm-256color

######################## Prompt ########################

white=$(tput setaf 255)
orange=$(tput setaf 214)

PS1='\[$white\]󱞩 \[$orange\]\W \[$white\]'

######################## SSH Agent ########################

SSH_ENV="$HOME/.ssh/environment"

function start_ssh_agent {
    echo "Initializing new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_ssh_agent;
    }
else
    start_ssh_agent;
fi

######################## Path ########################
