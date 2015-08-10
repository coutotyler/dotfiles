# Source default file
[ -e /etc/skel/.bashrc ] && source /etc/skel/.bashrc

# Get functions
[ -e ~/.bash_functions ] && source ~/.bash_functions

# Set up xterm
xrdb ~/.Xresources
[ -e ~/.dir_colors ] && eval `dircolors ~/.dir_colors`

# Path
pathmunge ~/Documents/scripts
pathmunge /usr/NX/bin after

# Environment variables
export PYTHONSTARTUP=~/.pythonrc.py
export HISTTIMEFORMAT=" [%F] [%T] "
export EDITOR=/usr/bin/vim

# Aliases
alias ps='ps -H'
alias grep='grep --color=auto'
alias more='more -d'
alias dirs='dirs -v'
alias trp='tr ":" "\n"'
alias view='vim -R'
alias ll='ls -lhH --group-directories-first'
alias lt='ls -lhrt' 
alias la='ll -A'
alias du='du -hsc'
alias df='df -h'
alias firefox='firefox > /dev/null 2>&1'

# Switches
set -o vi
