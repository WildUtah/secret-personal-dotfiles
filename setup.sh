#!/bin/bash

#here are all the dotfiles under control
#note that these have to be added manually. Yuck.
ln -fs ~/.dot/bashrc ~/.bashrc
ln -fs ~/.dot/profile ~/.profile
ln -fs ~/.dot/bash-profile ~/.bash-profile
ln -fs ~/.dot/lein/profiles.clj ~/.lein/profiles.clj
ln -fs ~/.dot/config/nvim/init.vim ~/.config/nvim/init.vim
ln -fs ~/.dot/inputrc ~/.inputrc
ln -fs ~/.dot/gitconfig ~/.gitconfig
ln -fs ~/.dot/iterm2 ~/.iterm2

