# Source default file
source ~/.bash_default

# Get functions
source ~/.bash_functions

# Path
pathmunge ~/Documents/scripts
pathmunge /usr/NX/bin after

# User specific environment variables
export PYTHONSTARTUP=~/.pythonrc.py
export HISTTIMEFORMAT=" [%F] [%T] "
export EDITOR=/usr/bin/vim

# User specific aliases
alias ps='ps -H'
alias grep='grep --color=auto'
alias more='more -d'
alias dirs='dirs -v'
alias trp='tr ":" "\n"'
alias view='vim -R'
alias ll='ls -lh --group-directories-first'
alias du='du -hsc'
alias df='df -h'

# User specific switches
set -o vi
