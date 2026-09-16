export PATH="/usr/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"
# History file location and size
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=$HISTSIZE

# History options for sharing and persistence
setopt APPEND_HISTORY         # Append history instead of overwriting
setopt INC_APPEND_HISTORY     # Write to history file immediately
setopt SHARE_HISTORY          # Share history across all sessions
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first
setopt HIST_IGNORE_ALL_DUPS   # Remove all duplicates in history
setopt HIST_FIND_NO_DUPS      # Do not display a line previously found
setopt HIST_IGNORE_SPACE      # Ignore commands that start with a space
setopt HIST_REDUCE_BLANKS     # Remove superfluous blanks

# Restore classic up/down arrow history navigation
bindkey '\e[A' history-search-backward # up-line-or-history
bindkey '\eOA' history-search-backward # up-line-or-history
bindkey '\e[B' history-search-forward # down-line-or-history
bindkey '\eOB' history-search-forward # down-line-or-history

# Home/End/Delete keys
bindkey "\e[1~" beginning-of-line      # Home
bindkey "\e[4~" end-of-line            # End
bindkey "\e[3~" delete-char            # Delete

# Alternate Home/End (for some terminals)
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line

# Ctrl+Left/Right Arrow (move by word)
bindkey "\e[1;5D" backward-word
bindkey "\e[1;5C" forward-word

# load aliases
[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases

# evals
eval "$(starship init zsh)"
eval "$(fzf --zsh)"
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit

(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

zinit light zsh-users/zsh-syntax-highlighting
zinit light Aloxaf/fzf-tab

### End of Zinit's installer chunk

# Completion setup
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# Enable case-insensitive completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $relpath'

# exports
export VIRTUAL_ENV_DISABLE_PROMPT=1
export PATH="$HOME/.opencode/bin:$PATH"

# yazi setup
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}


# Added by Antigravity CLI installer
export PATH="/home/ha/.local/bin:$PATH"

# Google Cloud SDK
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then
  source "$HOME/google-cloud-sdk/path.zsh.inc"
fi

if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then
  source "$HOME/google-cloud-sdk/completion.zsh.inc"
fi
