#!/bin/bash

# Define repo directory
#repoDir="/home/tyler/Documents/gitRepos"
repoDir="/Users/tcouto/Documents/gitRepos"

main() {
	link_dotfiles
	install_pip
	install_powerline
	install_syntastic
	install_dircolors
	install_pathogen
	install_scripts
}

# Set up dotfiles
link_dotfiles() {
	[ ! -e ~/.bashrc -o "$force" == "True" ] \
		&& ln -fs $repoDir/dotfiles/.bashrc ~/.bashrc \
		|| echo ".bashrc already exists"
	[ ! -e ~/.bash_functions -o "$force" == "True" ] \
		&& ln -fs $repoDir/dotfiles/.bash_functions ~/.bash_functions \
		|| echo ".bash_functions already exists"
	[ ! -e ~/.bash_profile -o "$force" == "True" ] \
		&& ln -fs $repoDir/dotfiles/.bash_profile ~/.bash_profile \
		|| echo ".bash_profile already exists"
	[ ! -e ~/.vim -o "$force" == "True" ] \
		&& ln -fs $repoDir/dotfiles/.vim ~/.vim \
		|| echo ".vim/ already exists"
	[ ! -e ~/.vimrc -o "$force" == "True" ] \
		&& ln -fs $repoDir/dotfiles/.vimrc ~/.vimrc \
		|| echo ".vimrc already exists"
	[ ! -e ~/.tmux.conf -o "$force" == "True" ] \
		&& ln -fs $repoDir/dotfiles/.tmux.conf ~/.tmux.conf \
		|| echo ".tmux.conf already exists"
	[ ! -e ~/.pythonrc.py -o "$force" == "True" ] \
		&& ln -fs $repoDir/dotfiles/.pythonrc.py ~/.pythonrc.py \
		|| echo ".pythonrc.py already exists"
	[ ! -e ~/.Xresources -o "$force" == "True" ] \
		&& ln -fs $repoDir/dotfiles/.Xresources ~/.Xresources \
		|| echo ".Xresources already exists"
	[ ! -e ~/.Xresources.d -o "$force" == "True" ] \
		&& ln -fs $repoDir/dotfiles/.Xresources.d ~/.Xresources.d \
		|| echo ".Xresources.d already exists"
}
	
install_pip() {
	if [ !`which pip` ]; then 
		if [ ! -e ~/Downloads/get-pip.py ]; then
			[ -e ~/Downloads ] || mkdir ~/Downloads 
			wget -O ~/Downloads/get-pip.py https://bootstrap.pypa.io/get-pip.py \
				|| { echo "Trouble downloading get-pip.py"; exit; }
		fi
		sudo python ~/Downloads/get-pip.py || echo "Trouble installing pip"
	fi
}

install_powerline() {
	which pip > /dev/null || { echo "Can't find pip"; exit; }
	which powerline > /dev/null || sudo pip install powerline-status

	# Get patched fonts for Powerline
	[ -d $repoDir/fonts ] \
		|| git clone https://github.com/powerline/fonts.git $repoDir/fonts
	if [ ! -d /user/share/fonts/X11 ]; then  
		sudo mkdir -p /usr/share/fonts/X11
		sudo fc-cache -f /usr/share/fonts/X11
		echo "System must reboot for changes to take effect." 
	fi
	[ -e "$repoDir/fonts/DejaVuSansMono/DejaVu Sans Mono for Powerline.ttf" ] \
		&& sudo cp "$repoDir/fonts/DejaVuSansMono/DejaVu Sans Mono for Powerline.ttf" /usr/share/fonts/X11/ \
		|| { echo "Can't find Deja Vu fonts for powerline"; exit; }
}
	
install_syntastic() {
	[ -d $repoDir/syntastic ] \
		|| git clone https://github.com/scrooloose/syntastic.git $repoDir/syntastic
	[ -h ~/.vim/bundle/syntastic ] \
		|| ln -s $repoDir/synstastic ~/.vim/bundle/syntastic
}

install_dircolors() { 
	[ -d $repoDir/dircolors-solarized ] \
		|| git clone https://github.com/seebi/dircolors-solarized.git $repoDir/dircolors-solarized
	[ -h ~/.dir_colors ] \
		|| ln -s $repoDir/dircolors-solarized/dircolors.256dark ~/.dir_colors
}

install_pathogen(){
	[ -d $repoDir/vim-pathogen ] \
		|| git clone https://github.com/tpope/vim-pathogen.git $repoDir/vim-pathogen
	[ -h ~/.vim/autoload/pathogen.vim ] \
		|| ln -s $repoDir/vim-pathogen/autoload/pathogen.vim ~/.vim/autoload/pathogen.vim 
}

install_scripts(){
	[ -d $repoDir/scripts ] \
		|| git clone https://github.com/coutotyler/scripts.git $repoDir/scripts
	$repoDir/scripts/setup.sh
}

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

if [ $0 != "-bash" ]; then
 main
fi
