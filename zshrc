# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-flow git-extras zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
# User configuration
export PATH=$HOME/bin:/usr/local/bin:$PATH
DISABLE_AUTO_TITLE=true

# load zmv
autoload -U zmv

# prompt
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}✗ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_PREFIX="[%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}-%{$fg[yellow]%}$(git_prompt_short_sha)%{$reset_color%}]"

function git_prompt() {
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "[%{$fg[blue]%}${ref#refs/heads/}%{$reset_color%}-%{$fg[yellow]%}$(git_prompt_short_sha)%{$reset_color%}]$(parse_git_dirty)"
  fi
}

PROMPT='%n@%m: %{$fg[green]%}%~%{$reset_color%}
$(git_prompt)%% '

# use vi to control command line
set -o vi

# general aliases
alias l='ls -CF'
alias ls='ls --color'
alias cl='clear'
alias ll='ls -lh'
alias vi='vim'

# rails aliases
alias be='bundle exec'
alias ber='bundle exec rspec'

# php aliases
alias phpunitc='phpunit --colors'

# git aliases
alias gst='git st'
alias gl='git l'
alias gps='git ps'
alias gpsod='git ps origin development'
alias gpsom='git ps origin master'
alias gbr='git br'
alias grh='git reset --hard'
alias gmg='git merge'
alias gmgod='git merge origin/development'
alias gmgom='git merge origin/master'
alias gft='git fetch'
alias ga='git aa'
alias gr='git remote -v'
alias gco='git co'
function gci(){
  git commit -m "$*"
}

# settings for tmux
alias tmux="TERM=screen-256color tmux"
alias tmcopy="tmux save-buffer - | xclip -i -selection clipboard"

# zsh alias
alias -s log='tail -f'
alias -g gp="| grep -i"

# load dir colors
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# load less color config
. $HOME/.dot_files/less_color.bash
