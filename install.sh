#!/bin/sh

sudo rm -rf ~/.vim*

sudo chmod +x astyle_sh
sudo chmod +x astyle
sudo cp astyle /bin
sudo cp astyle_sh /bin

sudo apt install build-essential cmake -y
sudo apt install python-dev python3-dev -y
sudo apt install ctags cscope -y

sudo ln -s $PWD/_vimrc ~/.vimrc
sudo ln -s $PWD/_vim ~/.vim



