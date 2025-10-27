# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/jotun/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
#

export XDG_CONFIG_HOME="$HOME/.config"
export PATH=$PATH:/opt/Discord:/opt/clangd

if tty -s; then
	if [[ $(tty) == "/dev/tty1" ]]; then
		# dbus-run-session Hyprland
		dbus-run-session niri --session
	fi
fi


# Find and set branch name var if in git repository.
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '['$branch']'
  fi
}
setopt prompt_subst


PROMPT='[%(?.%F{14}⏺.%F{9}⏺)%f] %F{3}%n%f %2~ %F{3}>%f '
RPROMPT='$(git_branch_name)'
alias ls='ls --color' 
