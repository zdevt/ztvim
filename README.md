
cd ~

git clone https://github.com/zdevt/ztvim.git ztvim

cd ztvim

sudo ./install

mkdir -p ~/.vim/bundle

cd ~/.vim/bundle

git clone https://github.com/VundleVim/Vundle.vim.git

open vim:
:pluginInstall 
waitting

cd ~/.vim/bundle/YouCompleteMe

./install.py --clang-completer



