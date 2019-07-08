
export CLASSPATH=$CLASSPATH:.
export PATH=/usr/local/bin:$PATH:~/bin:~/android-sdk-macosx/tools:~/android-sdk-macosx/platform-tools

export CLICOLOR=CLICOLOR
#export GNUTERM='x11'
HISTCONTROL=ignoredups:ignorespace:erasedups
HISTFILE=~/.local/.bash_history
shopt -s histappend
HISTSIZE=5000

export LESSHISTFILE=~/.local/lesshist

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
alias g++='g++-9 -std=c++1y '
alias c++='c++ -std=c++1y '
alias vi=nvim
alias more="less -XER "

export LESS=" -R "

set HOMEBREW_NO_GITHUB_API

function lolcolors {
  #remember to gem install lolcat
  if type -p lolcat > /dev/null;
  then 
    alias cat='lolcat -t '; 
    # You need to remove -t automatically on non-truecolor terminals
    # https://www.youtube.com/watch?v=LPn0KFlbqX8
    export LESSOPEN="| `type -p lolcat` -ft %s "
    return 0
  else
    echo "Please install lolcat with 'gem install lolcat'."
    return -1
  fi;
}

#alternate source of color
function gnucolors {
  #remember to brew install source-highlight
  local SRCHI="/usr/local/bin/source-highlight-esc.sh";
  if ! [ -x $SRCHI ]
  then
    SRCHI="/usr/share/source-highlight/source-highlight-esc.sh"
  fi;
  if ! [ -x $SRCHI ]
  then
    SRCHI="/usr/share/source-highlight/src-hilite-lesspipe.sh"
  fi;

  if [ -x $SRCHI ]
  then
    export LESSOPEN="| $SRCHI %s --failsafe "
    return 0
  else
    echo "Please install GNU source-highlight."
    return -1
  fi;
}

gnucolors || lolcolors

#OS/X slocate
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
  local LIGHT_RED="\[\033[38;5;9m\]"
  local WHITE="\[\033[1;37m\]"
  local NO_COLOUR="\[\033[0m\]"
  PS1="\[\033]0;\w\007${BLUE}${PREFIX}[$LIGHT_RED\$(~/bin/promptpwd)$BLUE]$CYAN\$(date +%H%M)$WHITE> $NO_COLOUR"
}

prom1
