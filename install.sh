#!/bin/bash

echo "Choose OS"
echo "(1) Unix"
echo "(2) MacOs"
read line

if [ $line -eq "1" ] ; then
	echo -n "You have curl and run with sudo? y/n: "
	read choice
	if [ $choice != "y" ] ; then
		exit
	fi
elif [ $line -eq "2" ] ; then
	echo -n "You have curl and brew? y/n: "
	read choice
	if [ $choice != "y" ] ; then
		exit
	fi
else
	echo "Bad number"
	exit
fi
	
	
echo "Copy Files"
cp ./vimrc ~/.vimrc
cp -R ./vim ~/.vim

echo "Install Pathogen"
mkdir -p ~/.vim/autoload ~/.vim/bundle && \curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "Install Nerdtree"
git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree

echo "Install Ctags"
if [ $line -eq "1" ] ; then
	apt-get install exuberant-ctags
else
	brew install ctags
fi
