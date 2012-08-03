#!/bin/bash

mv ~/.vimrc ~/.vimrc.bak
mv ~/.gvimrc ~/.gvimrc.bak
mv ~/.vim ~/.vim.bak

ln -s ~/vim ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc

#cd ~/.vim
#git submodule update --init

cd ~
