
export TERM=xterm-256color
export EDITOR=nvim
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jotun/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias ls="ls --color=auto"
alias ll="ls -al --color=auto"
PS1='%B%F{6}[%F{1}%n %B%F{11}%1~%B%F{6}]%# %F{7}'

# X Autostart
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	exec startx
fi

