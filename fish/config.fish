if set -q ZELLIJ; or not set -q HYPRLAND_INSTANCE_SIGNATURE
else
    zellij
end

set -g fish_greeting

# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/dispe/programs/google-cloud-sdk/path.fish.inc' ]; . '/home/dispe/programs/google-cloud-sdk/path.fish.inc'; end
