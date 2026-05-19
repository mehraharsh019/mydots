if status is-interactive
# Commands to run in interactive sessions can go here
    starship init fish | source
    fzf --fish | source
    fish_vi_key_bindings
end

set fish_greeting

# Load external aliases
if test -f ~/.config/fish/aliases.fish
    source ~/.config/fish/aliases.fish
end

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	command rm -f -- "$tmp"
end

