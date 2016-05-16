export EDITOR=/usr/local/bin/vim

alias vi="/usr/local/bin/vim"
alias ls="ls -vF"
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias h="history"
alias more="less"
alias zsh="/bin/zsh"
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
   "lm"      "| more"
   "lg"      "| grep -i"
   "lsg"     "ls | grep -i"
   "lr"      "ll -tra"
   "pg"      "ps auxwwf | grep -i"
   "psm"     "ps auxwwf | sort | more"
   "ns"      "netstat -anlp"
#   "gia"     "git add --"
#   "gic"     "git commit -m '"
#   "gid"     "git diff"
#   "gidw"    "git diff --cached"
#   "gil"     "git log --pretty=short"
#   "gir"     "git reset --soft HEAD^"
#   "girw"    "git reset HEAD --"
#   "gico"    "git checkout HEAD -- "
#   "gicw"    "git checkout -- "
#   "gis"     "git status"
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
if [ "$TERM" = "screen" ]; then
    preexec() {
        emulate -L zsh
        local -a cmd; cmd=(${(z)2})
        case $cmd[1] in
#            fg)
#                if (( $#cmd == 1 )); then 
#                    cmd=(builtin jobs -l %+)
#                else
#                    cmd=(builtin jobs -l $cmd[2])
#                fi
#            ;;
#            %*) 
#                cmd=(builtin jobs -l $cmd[1]) 
#            ;;
#            ls)
#                return
#            ;; 
#            cd)
#                if (( $#cmd == 2 )); then
#                    cmd[1]=$cmd[2]:t
#                else
#                    cmd[1]="~" 
#                fi
#                change_status_title $cmd[1]
#                return
#            ;;
#            vim|vi|gvim)
#                if (( $#cmd == 2)); then
#                  cmd[1]="v:$cmd[2]:t" 
#                fi
#                change_status_title $cmd[1]
#                return
#            ;;
            *)
                change_status_title $cmd[1]:t
                return
            ;; 
        esac

#        local -A jt; jt=(${(kv)jobtexts})
#        $cmd >>(
#            read num rest
#            cmd=(${(z)${(e):-\$jt$num}})
#            echo -n "k$cmd[1]:t\\"
#        ) 2>/dev/null 
     }

     precmd () {
        echo -n "k$(whoami)@$(hostname -s):$1\\"
     }
   
     change_status_title() {
        echo -n "k$(whoami)@$(hostname -s):$1\\"
     }
fi

##     ssh setting
function ssh_screen(){
	eval server=\${$#}
    screen -t $server ssh -o ServerAliveInterval=60 "$@"
#   ip=$(/usr/bin/host $server |grep 'has address' |awk '{print $4}')
#   screen -t $server ssh -o ServerAliveInterval=60 "$ip"
}
if [ x$TERM = xscreen ]; then
	alias lssh=ssh_screen
fi
