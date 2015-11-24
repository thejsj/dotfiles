#!/bin/bash

# Complete all the necessary steps to install VIM from scratch

# Add dir for swapfiles
mkdir -p ~/.vim/swap

# Intall Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

if which brew >/dev/null; then
  brew install cmake
  git clone git@github.com:Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
  cd ~/.vim/bundle/YouCompleteMe/
  git submodule update --init --recursive
  ./install.py --clang-completer
fi

# Install VIM bundles
cd ~/.vim/
vim +PlugunInstall +qall
