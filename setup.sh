#!/bin/bash

cd ~/.dot/
#here are all the dotfiles under control
#note that these have to be added manually. Yuck.
ln -fs ~/.dot/bashrc ~/.bashrc
ln -fs ~/.dot/bash_profile ~/.bash_profile
mkdir -p ~/.lein
ln -fs ~/.dot/lein/profiles.clj ~/.lein/profiles.clj
mkdir -p ~/.config/nvim
ln -fs ~/.dot/config/nvim/init.vim ~/.config/nvim/init.vim
ln -fs ~/.dot/inputrc ~/.inputrc
ln -fs ~/.dot/gitconfig ~/.gitconfig
ln -Fhfs ~/.dot/iterm2 ~/.iterm2

#ssh
mkdir -p ~/.ssh
chmod 700 ~/.ssh
if ! [[ -f ~/.ssh/authorized_keys ]] || 
  ! fgrep -q "`cat ~/.dot/ssh/id_rsa.pub`" ~/.ssh/authorized_keys;
then
  cat ~/.dot/ssh/id_rsa.pub >> ~/.ssh/authorized_keys;
fi
chmod 600 ~/.ssh/authorized_keys 

#prompt
if ! [[ -x ~/bin/promptpwd ]]; 
then 
  mkdir -p ~/bin/
  gcc -os -o promptpwd promptpwd.c
  strip -s promptpwd
  mv promptpwd ~/bin/promptpwd
fi;

