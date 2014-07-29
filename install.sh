#!/bin/bash

# clone the repo...
git clone git@github.com:imajes/vimfiles.git ~/.vim

# link the vims
ln -s ~/.vim/.vimrc ~/.vimrc

# install vundle.vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install the bundles
vim +PluginInstall +qall

echo "Done installing!"
