if not set -q ZELLIJ; and set -q XDG_CURRENT_DESKTOP
    zellij
end

set -g fish_greeting

# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/dispe/programs/google-cloud-sdk/path.fish.inc' ]; . '/home/dispe/programs/google-cloud-sdk/path.fish.inc'; end
