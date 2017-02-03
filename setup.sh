#!/bin/bash

cd ~/.dot/
#here are all the dotfiles under control
#note that these have to be added manually. Yuck.
ln -fs ~/.dot/bashrc ~/.bashrc
ln -fs ~/.dot/profile ~/.profile
ln -fs ~/.dot/bash-profile ~/.bash-profile
mkdir -p ~/.lein
ln -fs ~/.dot/lein/profiles.clj ~/.lein/profiles.clj
mkdir -p ~/.config/nvim
ln -fs ~/.dot/config/nvim/init.vim ~/.config/nvim/init.vim
ln -fs ~/.dot/inputrc ~/.inputrc
ln -fs ~/.dot/gitconfig ~/.gitconfig
ln -fs ~/.dot/iterm2 ~/.iterm2

if ![[ -x ~/bin/promptpwd ]]; 
then 
  gcc -o2 -o promptpwd promptpwd.c
  strip -s promptpwd
  mv promptpwd ~/bin/promptpwd
fi;

