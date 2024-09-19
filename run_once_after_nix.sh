#!/bin/bash

# Installing homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

eval "$(/opt/homebrew/bin/brew shellenv)"

# Installing nix
# sudo chmod 644 /etc/synthetic.conf
curl -L https://nixos.org/nix/install | sh -s -- --daemon

nix --extra-experimental-features flakes --extra-experimental-features nix-command run nix-darwin -- switch --flake ~/.config/nix

# Throbleshoting, Maybe you need to run this command
# sudo ln -s /nix/var/nix/profiles/default/etc/ssl/certs/ca-bundle.crt /etc/ssl/certs/ca-certificates.crt.before-nix-darwin
# sudo mv /etc/bashrc{,.before-nix-darwin}
# sudo mv /etc/zshrc{,.before-nix-darwin}
