export PATH="/usr/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"
# Sample .bashrc for SUSE Linux
# Copyright (c) SUSE Software Solutions Germany GmbH

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

test -s ~/.alias && . ~/.alias || true

#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

eval "$(fzf --bash)"
eval "$(starship init bash)"

# Aliases
alias grep='grep --color=auto'
alias ls="lsd"
alias la="lsd -a"
alias ll="lsd -l"
alias lla="lsd -la"
alias lt="lsd --tree"
alias top="htop"
alias btop="btop --force-utf"
# alias i="sudo pacman -S --needed"
# alias iy="paru -S --needed"
# alias s="pacman -Ss"
# alias sy="paru -Ss"
# alias q="pacman -Qs"
# alias r="sudo pacman -R"
# alias ra="sudo pacman -Rns"

export EDITOR=vim

# Functions
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}


# opencode
export PATH=/home/ha/.opencode/bin:$PATH


# Added by Antigravity CLI installer
export PATH="/home/ha/.local/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/ha/google-cloud-sdk/path.bash.inc' ]; then . '/home/ha/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/ha/google-cloud-sdk/completion.bash.inc' ]; then . '/home/ha/google-cloud-sdk/completion.bash.inc'; fi
