# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export HISTFILE=~/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt APPEND_HISTORY            # append to history file
setopt HIST_NO_STORE             # Don't store history commands


# Powerlevel10k
source ~/.zsh_plugins/powerlevel10k/powerlevel10k.zsh-theme

# zsh-autosuggestions
source ~/.zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# fzf-tab
autoload -U compinit; compinit
source ~/.zsh_plugins/fzf-tab/fzf-tab.plugin.zsh

# fzf-tab-source
source ~/.zsh_plugins/fzf-tab-source/fzf-tab-source.plugin.zsh

# fast-syntax-highlighting
source ~/.zsh_plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# bgnotify
source ~/.zsh_plugins/ohmyzsh/plugins/bgnotify/bgnotify.plugin.zsh

# autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# vi-mode
#source ~/.zsh_plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Fuck
eval $(thefuck --alias)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Various environment variables
export ARCHFLAGS="-arch arm64"
export EDITOR=nvim
export PATH=$HOME/bin:$HOME/.local/bin:$PATH
export PAGER='bat --paging=always'
export PYTHONBREAKPOINT='pudb.set_trace'
export CARGO_BUILD_TARGET=aarch64-apple-darwin

# Aliases
alias p=pymake
alias ls='lsd --group-directories-first'
alias ll='lsd -l --group-directories-first'
alias tree='lsd -l --group-directories-first --tree'
alias dd=lazydocker
alias gg=lazygit
alias d='docker compose'
alias ..='cd ..'
alias ss='source .venv/bin/activate'
alias t='tree --depth'

# emacs-like keys
bindkey -v
bindkey "^P" up-line-or-history
bindkey "^N" down-line-or-history
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

eval "$(direnv hook zsh)"
eval "$(gh copilot alias -- zsh)"

[ -f ~/.zshrc_plum ] && source ~/.zshrc_plum

eval $(pymake --setup-zsh-completion)

# FZF
export FZF_DEFAULT_COMMAND='fd --type f --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
source <(fzf --zsh)
