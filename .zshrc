# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
    autojump
    brew
    catimg
    celery
    colored-man
    colorize
    command-not-found
    django
    docker
    docker-compose
    extract
    git
    history-substring-search
    httpie
    mercurial
    npm
    osx
    pass
    pip
    pyenv
    python
    thefuck
    tmuxinator
    vagrant
    vi-mode
    web-search
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#bindkey -v

# Options
setopt HIST_EXPIRE_DUPS_FIRST HIST_IGNORE_ALL_DUPS HIST_FIND_NO_DUPS HIST_SAVE_NO_DUPS

function _hh {
    COLOR='\033[0;33m'
    NOCOLOR='\033[0;0m'
    echo -n $COLOR
    printf '=%.0s' {1..`tput cols`}
    echo $NOCOLOR
}
alias hh='_hh;'

alias ll="ls -lh"
alias cd..="cd .."
alias pse="pgrep -lf"
#alias maketags="ctags --exclude='**/transifex/htmlcov/**' --exclude='**/site_media/**' --exclude='**/migrations/**' --exclude='*min.js' --exclude='**/*live.js' --exclude='**/*stripe.js' --exclude='**/transifex/static/plugins/**' -o ~/devel/repos/transifex/txc/tags -R ~/devel/repos/transifex/txc ~/devel/env/tx/lib/python2.7/site-packages/django"
alias txc='tmuxinator start txc'
alias mg="python manage.py"
alias hl="hg glog --template '{rev} ({author|email}): {desc}\n' -l"
alias hm='hg extdiff -p meld'
alias hgid='hg log -r `hg id -n`'
alias txmigrate="mg syncdb --noinput && mg migrate"
#alias txsetup="mg txcreatenoticetypes && mg txlanguages && mg check_permissions"
alias scpresume="rsync --compress --partial --progress --recursive --rsh=ssh"
alias txtest="REUSE_DB=1 TX_ALL_TESTS=1 NOSE_NOCAPTURE=1 coverage run ./manage.py test"
alias whee="git pull --ff-only && git push && echo wheeeeeeeeeee!!! && say 'push successful'" || say 'push failed'
alias ff="git pull --ff-only"
alias grbd="git rebase devel"
alias reset_to_remote="git reset --hard \`git rev-parse --abbrev-ref --symbolic-full-name @{u}\`"
alias difffiles="hh git diff --name-only HEAD \`git merge-base HEAD devel\` | cat"
alias devel="git checkout devel"
alias force="git push --force-with-lease"
alias startvpn="sudo /usr/local/Cellar/openvpn/2.3.6/sbin/openvpn --config /etc/openvpn/openvpn.conf"
alias docker_rm_exited="docker ps -f status=exited | tail -n +2 | awk '{print \$1}' | xargs docker rm"
alias dcompose=docker-compose

alias dbjobs='echo "select pid, usename, backend_start, waiting, state, query from pg_catalog.pg_stat_activity;" | ./manage.py dbshell'
function dbkill {
    echo "select pg_cancel_backend($1)" | ./manage.py dbshell
}

alias hge='sed -i {s/^#\ hggit/hggit/g} ~/.hgrc'
alias hgd='sed -i {s/^hggit/#\ hggit/g} ~/.hgrc'

alias kbcode='ssh -t kbairak@10.9.11.49 /usr/local/bin/tmux a -ttxc'
alias httx='http --session=kb_admin'

# update some keybindings
bindkey "^R" history-incremental-search-backward
bindkey "^P" up-line-or-history
bindkey "^N" down-line-or-history
bindkey "^A" beginning-of-line
bindkey "^U" fuck-command-line

# cmds for workon - virtualenv
export WORKON_HOME="$HOME/devel/env"
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
pyenv virtualenvwrapper
export PYTHON_BUILD_CACHE_PATH=~/.pyenv/cache
# source /usr/local/opt/pyenv/shims/virtualenvwrapper.sh

export CDPATH="~/devel/repos"
export EDITOR="nvim"
export HISTSIZE=100000
export PYTHONDONTWRITEBYTECODE=1
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
#export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

PATH=$PATH:/Users/kbairak/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Frameworks/Mono.framework/Versions/Current/bin/

# Arch - pkgfile
#source /usr/share/doc/pkgfile/command-not-found.zsh

man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}

if [[ $1 == eval ]]
then
    "$@"
set --
fi

# PATH="/Users/kbairak/perl5/bin${PATH:+:${PATH}}"; export PATH;
# PERL5LIB="/Users/kbairak/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
# PERL_LOCAL_LIB_ROOT="/Users/kbairak/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
# PERL_MB_OPT="--install_base \"/Users/kbairak/perl5\""; export PERL_MB_OPT;
# PERL_MM_OPT="INSTALL_BASE=/Users/kbairak/perl5"; export PERL_MM_OPT;

export GITHUB_TOKEN=e545186badfa63e0b43490abf189fa4f37b2ba80

export NODE_PATH='/usr/local/lib/node_modules'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
