if status is-interactive
    # Commands to run in interactive sessions can go here
end

if set -q ZELLIJ
else
    zellij
end

# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"

fish_add_path $HOME/.cargo/bin

