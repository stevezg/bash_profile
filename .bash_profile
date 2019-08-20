alias gst='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit -am '
alias gp='git push'
alias gd='git diff'
alias go='git checkout '

alias got='git '
alias get='git '

alias c='clear'

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\e[0;33m\t:\e[m\e[0;31m\h\e[m\e[0;36m \W\e[m \$(parse_git_branch)\[\033[00m\] ⚡️ "
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
