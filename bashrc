
export CLASSPATH=$CLASSPATH:.
export PATH=/usr/local/bin:$PATH:~/bin:~/android-sdk-macosx/tools:~/android-sdk-macosx/platform-tools

export CLICOLOR=CLICOLOR
#export GNUTERM='x11'
HISTCONTROL=ignoredups:ignorespace
export EDITOR=nvim
export VISUAL=nvim

export FIGNORE=.o:~:.class

alias ll='ls -alp '
alias l='ls -lp '
alias rm='rm -i '
alias cgdb='cgdb -d /usr/local/bin/gdb '
alias gdb='/usr/local/bin/gdb'
alias g++='g++ -std=c++1y '
alias c++='c++ -std=c++1y '
#set -o vi
alias vi=nvim

set HOMEBREW_NO_GITHUB_API

if [-x "/usr/local/bin/lolcat"] && alias cat='lolcat '
if [-x "/usr/bin/mdfind"] && alias locate='mdfind -name '

function prom1 {
local BLUE="\[\033[0;34m\]"
#local RED="\[\033[38;5;124m"
local RED="\[\033[0;31m\]"
local CYAN="\[\033[0;36m\]"
local LIGHT_RED="\[\033[1;31m\]"
local WHITE="\[\033[1;37m\]"
local NO_COLOUR="\[\033[0m\]"
PS1="\[\033]0;\w\007$BLUE[$LIGHT_RED\$(~/bin/promptpwd)$BLUE]$CYAN\$(date +%H%M)$WHITE> $NO_COLOUR"
}

prom1
