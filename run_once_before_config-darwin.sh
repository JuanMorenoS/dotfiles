#!/bin/bash


## OS configs 

#Keyboard speed
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# Trackpad scroll direction
defaults write -g com.apple.swipescrolldirection -bool FALSE

# Autohide dock
osascript -e "tell application \"System Events\" to set the autohide of the dock preferences to true"

#Improve dock speed
defaults write com.apple.dock autohide-time-modifier -float 0.15


# config hot corners
## Botton-left show apps
defaults write com.apple.dock wvous-bl-corner -int 11

## Botton-right show desktop
defaults write com.apple.dock wvous-br-corner -int 4



killall Dock
