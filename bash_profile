
if [[ -x /usr/local/bin/brew ]]
then
  if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; 
  then
    . $(brew --prefix)/share/bash-completion/bash_completion
  fi
  PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
fi

# if [ -f $(brew --prefix)/etc/bash_completion ]; then
#   . $(brew --prefix)/etc/bash_completion 
#   fi
stty werase undef
source .bashrc
