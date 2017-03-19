autoload -Uz compinit promptinit
compinit
promptinit
bindkey -e
# This will set the default prompt to the walters theme
PROMPT="%F{red:}%n@%m:%/>%f"

zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES

#Aliases
alias ls="ls --color=auto -l"
alias grep="grep --color=auto"
bindkey "^[[3~" delete-char

