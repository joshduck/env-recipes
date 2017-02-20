#!/bin/bash
set -e

git clone https://github.com/joshduck/dotfiles.git
ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/vim/index.vim ~/.vim
