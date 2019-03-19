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
#export PATH="/anaconda/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
USER_BASE_PATH=$(python -m site --user-base)
export PATH=$PATH:$USER_BASE_PATH/bin
