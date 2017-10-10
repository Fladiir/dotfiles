autoload -Uz compinit promptinit
compinit
promptinit
bindkey -v
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES
PROMPT="%F{red}%B%n@%m%b:%f"$''"%F{blue:}%~>%f"
#Aliases
alias ls="ls --color=auto"
alias grep="grep --color=auto"
bindkey "^[[3~" delete-char


export PATH=$HOME/Programs/firefox:$PATH:/usr/local/bin/
export EDITOR=vim


