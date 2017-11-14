#!/bin/sh

#sudo rm -rf ~/.vim*

#sudo chmod +x astyle_sh
#sudo chmod +x astyle
#sudo cp astyle /bin
#sudo cp astyle_sh /bin

#sudo apt install build-essential cmake -y
#sudo apt install python-dev python3-dev -y
#sudo apt install ctags cscope -y

#sudo ln -s $PWD/_vimrc ~/.vimrc
#sudo ln -s $PWD/_vim ~/.vim


SYSTYPE=`uname`

if [ $SYSTYPE = "Linux" ];
then 
  sudo \cp ./astyle ~/.vim/astyle
  sudo \cp ./astyle_sh ~/.vim/astyle_sh
elif [ $SYSTYPE = "Darwin" ];
then 
  sudo \cp ./astyle_mac ~/.vim/astyle
  sudo \cp ./astyle_mac_sh ~/.vim/astyle_sh
else 
  echo "Linux"
fi

