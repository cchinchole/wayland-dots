#!/usr/bin/bash
# Get the current workspace ID
workspace_id=$(hyprctl activeworkspace -j | jq ".id")
# Find Firefox instances on the current workspace
current_ff_cmd='hyprctl clients -j | jq ".[] | select(.initialClass == \"firefox\" and .workspace.id == '$workspace_id') | .address"'
current_ff_address=$(eval $current_ff_cmd)
url=$1

if [ -z "$url" ]; then
    echo "No URL provided" >&2
    exit 1
fi

if [ -n "$current_ff_address" ]; then
    # Remove quotes from address
    current_ff_address=$(echo $current_ff_address | tr -d '"')
    # Focus the existing Firefox instance on the current workspace
    hyprctl dispatch focuswindow address:$current_ff_address
    firefox --new-tab "$url"
else
    # Check if Firefox is open on another workspace
    ff_address=$(hyprctl clients -j | jq -r '.[] | select(.initialClass == "firefox") | .address' | head -n 1)
    if [ -n "$ff_address" ]; then
        # Get the workspace ID of the Firefox instance
        ff_workspace=$(hyprctl clients -j | jq -r ".[] | select(.address == \"$ff_address\") | .workspace.id")
        # Switch to the Firefox workspace and focus the window
        hyprctl dispatch workspace $ff_workspace
        hyprctl dispatch focuswindow address:$ff_address
        firefox --new-tab "$url"
    else
        # Open a new Firefox window if none exists
        firefox --new-window "$url"
    fi
fi
