# My personal dot files #

## Nothing here will likely work for you do not use this ##
1. pkgs_new - Latest file of packages to use, sorted from pkgs.

## Changelog ##
1. 7/07/25 - Removed many apps as they were not used.
2. 7/07/25 - Swapped hyprland back from using UWSM and removed ALL environment variables for testing, so far, haven't had issues so leaving this way thus far.
COMMIT #9955bd3 has bspwm, environment.d, ohmyposh, picom, polybar, sway, sxhkd, systemd/user, tmux, uwsm, wal/templates, and wezterm

## Getting / Setting Mime ##
xdg-mime query default inode/directory
xdg-mime default thunar.desktop inode/directory

## Fixing the mime for the url-handler ##
update-desktop-database ~/.local/share/applications
xdg-mime default open-url.desktop x-scheme-handler/http
xdg-mime default open-url.desktop x-scheme-handler/https
