#!/bin/bash

# Assumes that the vim repo lives at ~/.vim

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

ln -s ~/.vim/vimrc ~/.vimrc

vim +BundleInstall +qall

