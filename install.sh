#!/bin/bash

if [ $USER != "root" ]
then
	echo "Need root privileges"
	echo "Continue ? y/n"
	read line
	if [ $line == "y" ] ; then
		if [ ! -e "/usr/bin/curl" ] || [ ! -e "/usr/bin/git" ] || [ ! -e "/bin/zsh" ] ; then
			echo "Need curl/git/zsh"
			exit
		fi
	else
		exit
	fi
fi

echo "Choose OS"
echo "(1) Unix"
echo "(2) MacOs"
read line
if [ $line != "1" ] && [ $line != "2" ] ; then
	echo "bad number"
	exit
fi

if [ $USER == "root" ]
then
	if [ $line == "1" ] ; then
		if [ ! -e "/usr/bin/curl" ] ; then
			apt install curl -y
		fi
		if [ ! -e "/bin/zsh" ] ; then
			/bin/bash -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
		fi
		if [ ! -e "/usr/bin/git" ] ; then
			apt install git-all -y
		fi
	elif [ $line == "2" ] ; then
		if [ ! -e "/usr/local/bin/brew" ] ; then
			/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
		fi
		if [ ! -e "/usr/bin/curl" ] ; then
			brew install curl
		fi
		if [ ! -e "/bin/zsh" ] ; then
			/bin/bash -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
		fi
		if [ ! -e "/usr/bin/git" ] ; then
			brew install git
		fi
	fi
fi

# Set variables

if [ ! -z "$USER" ]
then
    echo "USER=`/usr/bin/whoami`" >> ~/.zshrc
    echo "export USER" >> ~/.zshrc
fi

if [ ! -z "$GROUP" ]
then
    echo "GROUP=`/usr/bin/id -gn $user`" >> ~/.zshrc
    echo "export GROUP" >> ~/.zshrc
fi

if [ ! -z "$MAIL" ]
then
    echo "MAIL="$USER@student.42.fr"" >> ~/.zshrc
    echo "export MAIL" >> ~/.zshrc
fi

echo "Copy Files"
cp -R vim ~/.vim
cp ./vimrc ~/.vimrc

echo "Install Pathogen"
mkdir -p ~/.vim/autoload ~/.vim/bundle && \curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "Install Nerdtree"
git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree

if [ $USER == "root" ] ; then
	echo "Install Ctags"
	if [ $line == "1" ] ; then
		apt install exuberant-ctags
	else
		brew install ctags
	fi
fi

source ~/.zshrc
