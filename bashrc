
export CLASSPATH=$CLASSPATH:.
export PATH=/usr/local/bin:$PATH:~/bin:~/android-sdk-macosx/tools:~/android-sdk-macosx/platform-tools

export CLICOLOR=CLICOLOR
#export GNUTERM='x11'
HISTCONTROL=ignoredups:ignorespace

export EDITOR=nvim
export VISUAL=nvim

export FIGNORE=.o:~:.class

#compatible with BSD (OS/X) and GNU (Linux)
if ls --help 2>&1 | grep -q -- --color
then
    alias ls='ls --color=auto -hF '
    alias ll='ls --color=auto -halF '
    alias l='ls --color=auto -lhF '
else
    alias ls='ls -hFG '
    alias ll='ls -halFG '
    alias l='ls -lhFG '
fi
alias grep='grep --color=auto '
alias fgrep='fgrep --color=auto '
alias egrep='egrep --color=auto '

alias rm='rm -i '
alias cgdb='cgdb -d /usr/local/bin/gdb '
alias gdb='/usr/local/bin/gdb '
alias g++='g++ -std=c++1y '
alias c++='c++ -std=c++1y '
alias vi=nvim

set HOMEBREW_NO_GITHUB_API

if [ -x "/usr/local/bin/lolcat" ]; then alias cat='lolcat '; fi;
if [ -x "/usr/bin/mdfind" ]; then alias locate='mdfind -name '; fi;

function prom1 {
  local PREFIX=`hostname`;
  if [[ "utahbrian.com" == `hostname` ]]; then
    PREFIX="ub.c";
  elif [[ `hostname` =~ ".local" ]]; then
    PREFIX="";
  fi
local BLUE="\[\033[0;34m\]"
#local RED="\[\033[38;5;124m"
local RED="\[\033[0;31m\]"
local CYAN="\[\033[0;36m\]"
local LIGHT_RED="\[\033[1;31m\]"
local WHITE="\[\033[1;37m\]"
local NO_COLOUR="\[\033[0m\]"
PS1="\[\033]0;\w\007${BLUE}${PREFIX}[$LIGHT_RED\$(~/bin/promptpwd)$BLUE]$CYAN\$(date +%H%M)$WHITE> $NO_COLOUR"
}

prom1
