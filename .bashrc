# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.

set -o vi

alias hh='echo ==================================================================================;'
alias cd..="cd .."
alias pse="ps -e | grep -iE"
alias vim="vimx -p"
alias vim.="vim ."
alias maketags='rm tags && ctags -R ~/devel/env/tx/src ~/devel/env/tx/lib/python2.7/site-packages .'
alias txc='cd ~/devel/repos/my-devel/txc && tmux -f ~/.txmux.conf attach-session -t transifex'
alias mg="python manage.py"
alias hl="hh hg glog --template '{rev} ({author|email}): {desc}\n' -l"
alias hr='vim .hg/hgrc'
alias hm='hg extdiff -p meld'
alias hgid='hg log -r `hg id -n`'
alias txmigrate="hh mg syncdb --noinput && mg migrate"
#alias txsetup="hh mg txcreatenoticetypes && mg txlanguages && mg check_permissions"
alias scpresume="rsync --compress --partial --progress --recursive --rsh=ssh"
alias txtest="REUSE_DB=1 coverage run ./manage.py test"
alias ll="ls -lh"
alias whee="hh git pull --ff-only && git push && echo wheeeeeeeeeee !!!"
alias txvim="find . -name '*.pyc' -delete && maketags && vim"

alias hge='sed -i {s/^#\ hggit/hggit/g} ~/.hgrc'
alias hgd='sed -i {s/^hggit/#\ hggit/g} ~/.hgrc'

# bash history stuff
bind '"\e[A"':history-search-backward # first words of a command + up arrows
bind '"\e[B"':history-search-forward

# cmds for workon - virtualenv
export WORKON_HOME="$HOME/devel/env"
source /usr/bin/virtualenvwrapper.sh

export HISTSIZE=100000

export CDPATH="~/devel/repos"

export PYTHONDONTWRITEBYTECODE=1

pwd() {
  echo -e "   \033[1;34m"`builtin pwd`"\033[0m"
}

export PS1='[$(variprompt.sh $COLUMNS)] \$ '

# if [ -z $TMUX ]; then tmux; fi
