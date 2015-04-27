#!/bin/bash

# Set up dotfiles for a new computer
mv ~/.bashrc ~/.bash_default
ln -s ~/Documents/gitClones/dotfiles/.bashrc ~/.bashrc
ln -s ~/Documents/gitClones/dotfiles/.bash_functions ~/.bash_functions
ln -s ~/Documents/gitClones/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/Documents/gitClones/dotfiles/.vim ~/.vim
ln -s ~/Documents/gitClones/dotfiles/.vimrc ~/.vimrc
ln -s ~/Documents/gitClones/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/Documents/gitClones/dotfiles/.pythonrc.py ~/.pythonrc.py

