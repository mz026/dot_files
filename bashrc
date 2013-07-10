function git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/*\ //'
}
function git_short_hash {
  git rev-parse --short HEAD 2> /dev/null
}

# colors
c_reset="\[$(tput sgr0)\]"
c_black="\[$(tput setaf 0)\]"
c_red="\[$(tput setaf 1)\]"
c_green="\[$(tput setaf 2)\]"
c_yellow="\[$(tput setaf 3)\]"
c_blue="\[$(tput setaf 4)\]"
c_purple="\[$(tput setaf 5)\]"
c_cyan="\[$(tput setaf 6)\]"
c_white="\[$(tput setaf 7)\]"
c_bold="\[$(tput bold)\]"


# prompt
ps1_location="\u@\h: $c_green\w"
ps1_git="$c_reset$c_bold[$c_reset$c_blue\$(git_branch)$c_reset-$c_yellow\$(git_short_hash)$c_bold$c_reset]"
ps1_prompt="$c_white\$$c_reset "

PS1="$ps1_location\n$ps1_git$ps1_prompt"


# use vi to control command line
set -o vi

# aliases
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



# repository alias
repo_requirejs='git://github.com/jrburke/requirejs.git'
repo_text='git://github.com/requirejs/text.git'

# settings for tmux
alias tmux="TERM=screen-256color tmux"
alias tmcopy="tmux save-buffer - | xclip -i -selection clipboard"
