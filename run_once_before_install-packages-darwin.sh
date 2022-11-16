#!/bin/bash

#Installing homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

eval "$(/opt/homebrew/bin/brew shellenv)"

# Installing everything in the Brewfile
# TODO change the path
brew bundle --file /Users/juanmoreno/.local/share/chezmoi/Brewfile


