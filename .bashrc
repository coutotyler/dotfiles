# Source default file
[ -e /etc/skel/.bashrc ] && source /etc/skel/.bashrc

# Get functions
[ -e ~/.bash_functions ] && source ~/.bash_functions

# Set up xterm
#xrdb ~/.Xresources
#[ -e ~/.dir_colors ] && eval `dircolors ~/.dir_colors`

# Path
pathmunge ~/Documents/scripts
pathmunge /usr/NX/bin after

# Environment variables
export PYTHONSTARTUP=~/.pythonrc.py
export HISTTIMEFORMAT=" [%F] [%T] "
export EDITOR=/usr/bin/vim
export PS1="[\u@\h \W]\$ "

# Aliases
alias grep='grep --color=auto'
alias more='more -d'
alias dirs='dirs -v'
alias trp='tr ":" "\n"'
alias view='vim -R'
alias ls='ls -G'
alias ll='ls -lhH'
alias lt='ls -lhrt' 
alias la='ll -A'
alias du='du -hsc'
alias df='df -h'
alias firefox='firefox > /dev/null 2>&1'
alias google-chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
alias openconnect='openconnect -b'

# Switches
set -o vi
