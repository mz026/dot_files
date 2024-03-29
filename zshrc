export ZSH_DISABLE_COMPFIX=true
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-extras zsh-syntax-highlighting github kubectl poetry)
source $ZSH/oh-my-zsh.sh
# User configuration
export PATH=$HOME/bin:/usr/local/bin:$PATH
DISABLE_AUTO_TITLE=true

# load zmv
autoload -U zmv

# prompt
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}✘ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

function git_prompt() {
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "%{$fg_bold[yellow]%}$(git_prompt_short_sha).%{$fg_bold[blue]%}${ref#refs/heads/}%{$reset_color%} $(parse_git_dirty)"
  fi
}

PROMPT='%{$fg_bold[cyan]%}%~ $fg_bold[grey]$(date +"%H:%M:%S %m/%d")%{$reset_color%}
$(git_prompt)❯ '

# use vi to control command line
set -o vi

# general aliases
alias l='ls -CF'
alias ls='ls -G'
alias cl='clear'
alias ll='ls -lh'
alias vi='nvim'

# rails aliases
alias be='bundle exec'
alias ber='bundle exec rspec'

# elixir
# use elixir with vi binding
alias iexv='rlwrap -pGreen -S "iex >>> " -r --always-readline iex'

# node alias
# use node console with vi binding
alias nodev='rlwrap -pGreen -S "node >>> " -r --always-readline node'

# php aliases
alias phpunitc='phpunit --colors'

# git aliases
alias gst='git st'
alias gl='git l'
alias gps='git ps'
alias gpsod='git ps origin develop'
alias gpsom='git ps origin master'
alias gbr='git br'
alias grh='git reset --hard'
alias gmg='git merge'
alias gmgod='git merge origin/develop'
alias gmgom='git merge origin/master'
alias gft='git fetch'
alias ga='git aa'
alias gr='git remote -v'
alias gco='git co'
alias gpsf='git push --force-with-lease'
function gci(){
  git commit -m "$*"
}

# zsh alias
alias -s log='tail -f'
alias -g gp="| grep -i"

# docker
alias dk='docker'

# http simple server
alias simplesvr='ruby -run -ehttpd . -p8000'

# thefuck
alias fuck='eval $(thefuck $(fc -ln -1))'


# load dir colors
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

source $HOME/codes/lib/z/z.sh
source $HOME/.dot_files/fzf.sh
source $HOME/.dot_files/git-flow-completion.zsh

unset GREP_OPTIONS

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

setopt HIST_IGNORE_ALL_DUPS

# map ,d to esc in commandline
bindkey -s ,d '\e'

# set default editor
export EDITOR=nvim

# bindkey fix for vim mode: https://superuser.com/questions/476532/how-can-i-make-zshs-vi-mode-behave-more-like-bashs-vi-mode
vi-search-fix() {
  zle vi-cmd-mode
  zle .vi-history-search-backward
}
autoload vi-search-fix
zle -N vi-search-fix
bindkey -M viins '\e/' vi-search-fix

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000
setopt SHARE_HISTORY

# kubectl completion
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)
