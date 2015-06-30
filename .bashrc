# Source default file
[ -e ~/.bash_default ] && source ~/.bash_default

# Get functions
[ -e ~/.bash_functions ] && source ~/.bash_functions

# Set up xterm
xrdb ~/.Xresources

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
alias ll='ls -lhH --group-directories-first'
alias lt='ls -lhrt' 
alias du='du -hsc'
alias df='df -h'

# User specific switches
set -o vi
