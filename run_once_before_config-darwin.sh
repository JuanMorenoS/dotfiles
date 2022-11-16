#!/bin/bash


## OS configs 

#Keyboard speed
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# Trackpad scroll direction
defaults write -g com.apple.swipescrolldirection -bool FALSE

# Autohide dock
osascript -e "tell application \"System Events\" to set the autohide of the dock preferences to true"
