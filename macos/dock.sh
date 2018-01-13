#!/bin/sh

dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/App Store.app"
dockutil --no-restart --add "/Applications/System Preferences.app"
dockutil --no-restart --add "/Applications/Google Chrome.app"

# Spacer
# defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'

# Downloads Folder
dockutil --no-restart --add "~/Downloads"

# Recent Apps
defaults write com.apple.dock persistent-others -array-add '{"tile-data" = {"list-type" = 1;}; "tile-type" = "recents-tile";}'

killall Dock
