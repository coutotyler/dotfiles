#!/bin/bash

# Define repo directory
repo="/home/tyler/Documents/gitRepos/dotfiles"

# Parse options
while [[ $# > 0 ]] ; do
	arg="$1"
	case $arg in
		-f|--force)
			force=True
			;;
		*)
			;;
	esac
	shift
done

# Set up dotfiles for a new computer
[ ! -e ~/.bash_default -o "$force" == "True" ] \
	&& mv ~/.bashrc ~/.bash_default \
	|| echo ".bash_default already exists"
[ ! -e ~/.bashrc -o "$force" == "True" ] \
	&& ln -fs $repo/.bashrc ~/.bashrc \
	|| echo ".bashrc already exists"
[ ! -e ~/.bash_functions -o "$force" == "True" ] \
	&& ln -fs $repo/.bash_functions ~/.bash_functions \
	|| echo ".bash_functions already exists"
[ ! -e ~/.bash_profile -o "$force" == "True" ] \
	&& ln -fs $repo/.bash_profile ~/.bash_profile \
	|| echo ".bash_profile already exists"
[ ! -e ~/.vim -o "$force" == "True" ] \
	&& ln -fs $repo/.vim ~/.vim \
	|| echo ".vim/ already exists"
[ ! -e ~/.vimrc -o "$force" == "True" ] \
	&& ln -fs $repo/.vimrc ~/.vimrc \
	|| echo ".vimrc already exists"
[ ! -e ~/.tmux.conf -o "$force" == "True" ] \
	&& ln -fs $repo/.tmux.conf ~/.tmux.conf \
	|| echo ".tmux.conf already exists"
[ ! -e ~/.pythonrc.py -o "$force" == "True" ] \
	&& ln -fs $repo/.pythonrc.py ~/.pythonrc.py \
	|| echo ".pythonrc.py already exists"
[ ! -e ~/.Xresources -o "$force" == "True" ] \
	&& ln -fs $repo/.Xresources ~/.Xresources \
	|| echo ".Xresources already exists"
[ ! -e ~/.Xresources.d -o "$force" == "True" ] \
	&& ln -fs $repo/.Xresources.d ~/.Xresources.d \
	|| echo ".Xresources.d already exists"

# Setup Powerline for tmux
#
[ -e `which pip` ] || sudo pip powerline-status install 

# Get patched fonts for Powerline
[ -e ${repo%/*}/fonts ] \
	|| git clone git@github.com:powerline/fonts.git ${repo%/*}/fonts
[ -e "${repo%/*}/fonts/DejaVuSansMono/DejaVu Sans Mono for Powerline.ttf" ] \
	&& sudo cp "${repo%/*}/fonts/DejaVuSansMono/DejaVu Sans Mono for Powerline.ttf" /usr/share/fonts/X11/ \
	|| { echo "Can't find Deja Vu fonts for powerline"; exit; }
sudo fc-cache -f /usr/share/fonts/X11
echo "System must reboot for changes to take effect." 
