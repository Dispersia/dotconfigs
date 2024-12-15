if not set -q ZELLIJ; and set -q XDG_CURRENT_DESKTOP
    zellij
end

set -g fish_greeting

# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/dispe/programs/google-cloud-sdk/path.fish.inc' ]; . '/home/dispe/programs/google-cloud-sdk/path.fish.inc'; end

# pnpm
set -gx PNPM_HOME "/home/dispe/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
