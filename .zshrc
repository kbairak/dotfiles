# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/home/kbairak/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    archlinux
    autojump
    colored-man-pages
    celery
    django
    docker
    docker-compose
    git
    httpie
    kubectl
    npm
    pass
    pip
    python
    thefuck
    tmuxinator
    vi-mode
    virtualenvwrapper
)

source $ZSH/oh-my-zsh.sh

setopt HIST_EXPIRE_DUPS_FIRST HIST_IGNORE_ALL_DUPS HIST_FIND_NO_DUPS HIST_SAVE_NO_DUPS


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
function _hh {
    COLOR='\033[0;33m'
    NOCOLOR='\033[0;0m'
    echo -n $COLOR
    printf '=%.0s' {1..`tput cols`}
    echo $NOCOLOR
}
alias hh='_hh;'
alias cd..="cd .."
alias pse="pgrep -lf"
alias txc='tmuxinator start txc'
alias mg="python manage.py"
alias scpresume="rsync --compress --partial --progress --recursive --rsh=ssh"
alias txtest="REUSE_DB=1 TX_ALL_TESTS=1 NOSE_NOCAPTURE=1 coverage run ./manage.py test"
alias whee="git pull --ff-only && git push && echo wheeeeeeeeeee!!!"
alias ff="git pull --ff-only"
alias grbd="git rebase devel"
alias reset_to_remote="git reset --hard \`git rev-parse --abbrev-ref --symbolic-full-name @{u}\`"
alias devel="git checkout devel"
alias force="git push --force-with-lease"
alias dcompose=docker-compose
alias kill_orphans='yaourt --query --unrequired --deps'
alias world='yaourt --query --explicit'
alias cat=bat
alias ls=lsd
alias ll="ls -l"

bindkey "^P" up-line-or-history
bindkey "^N" down-line-or-history
bindkey "^A" beginning-of-line
bindkey "^U" fuck-command-line

export WORKON_HOME=~/devel/env
source /usr/bin/virtualenvwrapper.sh

export PAGER="vimpager"
export PYTHONDONTWRITEBYTECODE=1

# Node/npm
export NPM_PACKAGES=/home/kbairak/global_npm
export NODE_PATH=/home/kbairak/global_npm/lib/node_modules:$NODE_PATH
export MANPATH=/home/kbairak/global_npm/share/man:$(manpath)

PATH=$PATH:/home/kbairak/bin:/home/kbairak/.local/bin:/home/kbairak/global_npm/bin

source ~/.zshrc_secret

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
