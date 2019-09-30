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

COLOR_RED="\033[0;31m"
COLOR_YELLOW="\033[0;33m"
COLOR_GREEN="\033[0;32m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_BLUE="\033[0;34m"
COLOR_WHITE="\033[0;37m"
COLOR_RESET="\033[0m"

function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ ! $git_status =~ "working directory clean" ]]; then
    echo -e $COLOR_BLUE
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $COLOR_YELLOW
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $COLOR_GREEN
  else
    echo -e $COLOR_OCHRE
  fi
}

function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo "($branch)"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo "($commit)"
  fi
}


LS_COLORS="di=1;32"

PS1="\e[0;33m\t \e[0;32m\d\e[m\e[m \e[0;31m \h\e[m \e[0;36m\W\e[m ⚡️ "
PS1+="\[\$(git_color)\]"
PS1+="\$(git_branch)"
PS1+="\[$COLOR_RESET\] "
export PS1
export CLICOLOR=1

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH
