if [ ! -f "$(which brew)" ]; then
    echo "Installing brew and tools"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
    brew bundle --file "./Brewfile"
  else
    echo "Updating homebrew"
    brew update
  fi
