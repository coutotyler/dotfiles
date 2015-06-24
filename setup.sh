#!/bin/bash

# Set up dotfiles for a new computer
mv ~/.bashrc ~/.bash_default
ln -s ~/Documents/gitRepos/dotfiles/.bashrc ~/.bashrc
ln -s ~/Documents/gitRepos/dotfiles/.bash_functions ~/.bash_functions
ln -s ~/Documents/gitRepos/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/Documents/gitRepos/dotfiles/.vim ~/.vim
ln -s ~/Documents/gitRepos/dotfiles/.vimrc ~/.vimrc
ln -s ~/Documents/gitRepos/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/Documents/gitRepos/dotfiles/.pythonrc.py ~/.pythonrc.py

