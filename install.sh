#!/bin/sh

SYSTYPE=`uname`

rm -rf ~/.vim*

ln -s $PWD/_vimrc ~/.vimrc
ln -s $PWD/_vim ~/.vim

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

chmod +x ./_vim/astyle_sh

if [ $SYSTYPE = "Linux" ];
then 
  chmod +x astyle
  \cp ./astyle ~/.vim/astyle
fi

