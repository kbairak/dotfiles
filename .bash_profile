# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
[[ -f ~/.bashrc ]] && . ~/.bashrc

# User specific environment and startup programs

export EDITOR=/usr/bin/vim

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH

if [ -z "$SSH_AUTH_SOCK" -a -x "/usr/bin/ssh-agent" ]; then
    eval `/usr/bin/ssh-agent -s`
    trap "kill $SSH_AGENT_PID" 0
fi
