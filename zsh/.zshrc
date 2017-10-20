
main_session='Main' 



autoload -Uz compinit promptinit
compinit
promptinit
bindkey -v
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES
PROMPT="%F{red:}%B%n@%m%b:%f"$''"%F{cyan:}%~>%f"

#Aliases
alias ls="ls --color=auto"
alias grep="grep --color=auto"
bindkey "^[[3~" delete-char


export PATH=$HOME/Programs/firefox:$PATH:/usr/local/bin/
export EDITOR=vim

as(){
    
    tmux attach-session -t $main_session
    
    if [[ $? -ne 0 ]]; then
        tmux new -ds $main_session
        tmux split-pane -ht $main_session
		tmux resize-pane -x 30 
		tmux split-pane -vt $main_session
        tmux select-pane -t $main_session:0.1
		tmux resize-pane -y 30
        tmux select-pane -t $main_session:0.0
        tmux attach -t $main_session

    fi 

}
