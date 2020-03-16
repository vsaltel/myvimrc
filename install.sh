#!/bin/bash

echo "Choose OS"
echo "(1) Unix"
echo "(2) MacOs"
read line

if [ $line = "Unix" ] ; then
	echo -n "You have curl ? y/n: "
	read choice
	if [ $choice != "y" ] ; then
		exit
	fi
else
	echo -n "You have curl and brew? y/n: "
	read choice
	if [ $choice != "y" ] ; then
		exit
	fi
	
cp ./vimrc ~/.vimrc
cp -R ./vim ~/.vim
mkdir -p ~/.vim/autoload ~/.vim/bundle && \curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree

if [ $line = "Unix" ] ; then
	apt-get get install exuberant-ctags
else
	brew install ctags
fi
