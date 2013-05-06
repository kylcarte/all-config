# bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

if [ -f .bashrc_local ]; then
    . .bashrc_local
fi

#export PS1=[\u@\h \W]\$ 
#export PS1="\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] "
#export PS1="\n\$(if [[ \$? == 0 ]]; then echo \"\[\033[0;34m\]\"; else echo \"\[\033[0;31m\]\"; fi)\342\226\210\342\226\210 [ \W ] [ \t ]\n\[\033[0m\]\342\226\210\342\226\210 "
if [ "$TERM" == "xterm" ]; then
    PROMPT="$"
else 
    PROMPT="\342\226\210\342\226\210"
fi
export PS1="\n\$(if [[ \$? == 0 ]]; then echo \"\[\033[0;34m\]\"; else echo \"\[\033[0;31m\]\"; fi)$PROMPT [ \w ]\n\[\033[0m\]$PROMPT "

# User specific aliases and functions
alias sl='ls'
alias v='vim'
alias g='git'
alias s='search'
alias e='emacsclient -nw'
alias hi='ghci -no-user-package-db -package-db cabal-dev/packages-7.6.1.conf'
alias hs='ghc -no-user-package-db -package-db cabal-dev/packages-7.6.1.conf'

alias c='cabal-dev'
alias cc='cabal-dev configure'
alias cb='cabal-dev build'
alias ci='cabal-dev install'

unset command_not_found_handle


