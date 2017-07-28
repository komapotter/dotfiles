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
export PATH=$PATH:/usr/local/opt/go/bin
export GOPATH=$HOME/dev
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight
export PATH=$PATH:$HOME/.cargo/bin
export RUST_SRC_PATH=$HOME/dev/src/github.com/rust-lang/rust/src
