#!/bin/bash

#here are all the dotfiles under control
#note that these have to be added manually. Yuck.
ln -fs ~/.dot/bashrc ~/.bashrc
ln -fs ~/.dot/profile ~/.profile
ln -fs ~/.dot/lein/profiles.clj ~/.lein/profiles.clj
ln -fs ~/.dot/config/nvim/init.vim ~/.config/nvim/init.vim
ln -fs ~/.dot/inputrc ~/.inputrc
ln -fs ~/.dot/gitconfig ~/.gitconfig
ln -s ~/.dot/iterm2/com.googlecode.iterm2.plist ~/.iterm2/com.googlecode.iterm2.plist

