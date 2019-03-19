export EDITOR=/usr/local/bin/vim

alias vi="vim"
alias ls="ls -vF"
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias h="history"
alias more="less"
alias cd="pushd"
alias p="popd"

function setenv ()
{
    export $1=$2
}

###     language setting
export LANG=ja_JP.UTF-8

###     history setting
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

###     prompt setting
setopt prompt_subst
PROMPT=$'%{[$[31+$RANDOM % 6]m%}%U$HOST'"{%n}%b%(!.#.$)%{[m%}%u "
#RPROMPT=$'%{[37m%}[%~]%{[m%}'

## completion
fpath=(~/.zsh/completions $fpath)

###     auto complete
autoload -U compinit
compinit

###     directory history
setopt autopushd
alias gd='dirs -v; echo -n "select number: "; read newdir; cd -"$newdir"'
setopt auto_remove_slash

###     vi editor
bindkey -v
bindkey '^R' history-incremental-search-backward

###     OnDemand alias
typeset -A myabbrev
myabbrev=(
   "gp"      "git push origin"
   "lm"      " | more"
   "lg"      " | grep -i"
   "lsg"     "ls | grep -i"
   "lr"      "ls -ltra"
   "pg"      "ps aux | grep -i"
   "psm"     "ps aux | sort | more"
   "ns"      "netstat -anlp"
)
my-expand-abbrev() {
   local left prefix
   left=$(echo -nE "$LBUFFER" | sed -e "s/[_a-zA-Z0-9]*$//")
   prefix=$(echo -nE "$LBUFFER" | sed -e "s/.*[^_a-zA-Z0-9]\([_a-zA-Z0-9]*\)$/\1/")
   LBUFFER=$left${myabbrev[$prefix]:-$prefix}" "
}
magic-space() {
    my-expand-abbrev
}
zle -N my-expand-abbrev
zle -N magic-space
bindkey " " magic-space

###     GNU screen title
if [ "$TERM" = "screen-256color" ]; then
    preexec() {
        emulate -L zsh
        local -a cmd; cmd=(${(z)2})
        case $cmd[1] in
            vim|vi|gvim)
                if (( $#cmd == 2 )); then
                    cmd[1]="v:$cmd[2]:t"
                fi
                change_status_title $cmd[1]
                return
            ;;
        esac
     }

     precmd () {
        echo -n "k$(whoami)@$(hostname -s):`pwd`\\"
     }
   
     change_status_title() {
        echo -n "k$(whoami)@$(hostname -s):$1\\"
     }
fi

##     ssh setting
function ssh_screen(){
	eval server=\${$#}
    screen -t $server ssh -o ServerAliveInterval=60 "$@"
}
if [ x$TERM = xscreen ]; then
	alias lssh=ssh_screen
fi

## aws-cli
source /usr/local/bin/aws_zsh_completer.sh

## direnv
eval "$(direnv hook zsh)"

## embulk
##export PATH="$HOME/.embulk/bin:$PATH"

## digdag
export PATH="$HOME/bin:$PATH"

## peco-src
bindkey '' peco-src
function peco-src() {
  local src=$(ghq list --full-path | peco --query "$LBUFFER")
  if [ -n "$src" ]; then
    BUFFER="cd $src"
    zle accept-line
  fi
  zle -R -c
}
zle -N peco-src

## hub
function git(){hub "$@"}
eval "$(hub alias -s)"

## gcloud
#source ~/dev/misc/google-cloud-sdk/path.zsh.inc
#source ~/dev/misc/google-cloud-sdk/completion.zsh.inc

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
