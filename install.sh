#!/bin/sh

SYSTYPE=`uname`

#sudo apt install build-essential cmake -y
#sudo apt install python-dev python3-dev -y
#sudo apt install ctags cscope -y

sudo rm -rf ~/.vim*
sudo ln -s $PWD/_vimrc ~/.vimrc
sudo ln -s $PWD/_vim ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

sudo chmod +x astyle_sh
sudo \cp ./astyle_sh ~/.vim/astyle_sh

if [ $SYSTYPE = "Linux" ];
then 
  sudo chmod +x astyle
  sudo \cp ./astyle ~/.vim/astyle
elif [ $SYSTYPE = "Darwin" ];
then 
  sudo chmod +x astyle_mac
  sudo \cp ./astyle_mac ~/.vim/astyle
else 
  echo "Linux"
fi

