# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

# colorized prompt
if [ "$PS1" ]; then
	PS1='\[\033[1;32m\]\u@\h \[\033[1;34m\]\W \$ \[\033[0m\]'
fi
set -o vi
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
