# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-flow git-extras zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
# User configuration
export PATH=$HOME/bin:/usr/local/bin:$PATH


function git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/*\ //'
}
function git_short_hash {
  git rev-parse --short HEAD 2> /dev/null
}

ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}✗ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
# prompt
setopt PROMPT_SUBST
autoload -U colors && colors
PROMPT='%n@%m: %{$fg[green]%}%~%{$reset_color%}
[%{$fg[blue]%}$(git_branch)%{$reset_color%}-%{$fg[yellow]%}$(git_short_hash)%{$reset_color%}]$(parse_git_dirty)%% '

# use vi to control command line
set -o vi

# aliases
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
alias gci='git ci'
alias gr='git remote -v'
alias gco='git co'

# settings for tmux
alias tmux="TERM=screen-256color tmux"
alias tmcopy="tmux save-buffer - | xclip -i -selection clipboard"

# load less color config
. $HOME/.dot_files/less_color.bash
