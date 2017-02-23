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
export GOROOT=`go env GOROOT`
export GOPATH=$HOME/dev/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOROOT/bin:$GOBIN
export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight
