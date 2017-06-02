# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH
#export PATH="$HOME/.plenv/bin:$PATH"
#eval "$(plenv init -)"
#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"

# added by Anaconda3 4.3.1 installer
export PATH="/anaconda/bin:$PATH"
