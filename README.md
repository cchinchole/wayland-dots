# My personal dot files #

## Nothing here will likely work for you do not use this ##

## Getting / Setting Mime ##
xdg-mime query default inode/directory
xdg-mime default thunar.desktop inode/directory

## Fixing the mime for the url-handler ##
update-desktop-database ~/.local/share/applications
xdg-mime default open-url.desktop x-scheme-handler/http
xdg-mime default open-url.desktop x-scheme-handler/https
