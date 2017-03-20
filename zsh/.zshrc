autoload -Uz compinit promptinit
compinit
promptinit
bindkey -e


zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES

#Aliases
alias ls="ls --color=auto -l"
alias grep="grep --color=auto"
bindkey "^[[3~" delete-char


