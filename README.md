cd ~

git clone https://github.com/zdevt/ztvim.git
cd ztvim
./install.sh

vim:
:PluginInstall 

cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer

