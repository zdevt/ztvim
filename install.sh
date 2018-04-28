#!/bin/sh

SYSTYPE=`uname`

#sudo apt install build-essential cmake -y
#sudo apt install python-dev python3-dev -y
#sudo apt install ctags cscope -y

rm -rf ~/.vim*
ln -s $PWD/_vimrc ~/.vimrc
ln -s $PWD/_vim ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

chmod +x astyle_sh
\cp ./astyle_sh ~/.vim/astyle_sh

if [ $SYSTYPE = "Linux" ];
then 
  chmod +x astyle
  \cp ./astyle ~/.vim/astyle
elif [ $SYSTYPE = "Darwin" ];
then 
  chmod +x astyle_mac
  \cp ./astyle_mac ~/.vim/astyle
else 
  echo "Linux"
fi

