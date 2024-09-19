{
  description = "Juan's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };



  outputs = inputs@{ self, nix-darwin, nixpkgs }:
    let
      configuration = { pkgs, ... }: {
        # List packages installed in system profile. To search by name, run:
        # $ nix-env -qaP | grep wget
        environment.systemPackages =
          [
            pkgs.vim
          ];

        # Auto upgrade nix package and the daemon service.
        services.nix-daemon.enable = true;
        # nix.package = pkgs.nix;

        # Necessary for using flakes on this system.
        nix.settings.experimental-features = "nix-command flakes";

        # Create /etc/zshrc that loads the nix-darwin environment.
        programs.zsh.enable = true; # default shell on catalina
        # programs.fish.enable = true;

        # Set Git commit hash for darwin-version.
        system.configurationRevision = self.rev or self.dirtyRev or null;

        # Used for backwards compatibility, please read the changelog before changing.
        # $ darwin-rebuild changelog
        system.stateVersion = 5;

        # The platform the configuration will be used on.
        nixpkgs.hostPlatform = "aarch64-darwin";




        security.pam.enableSudoTouchIdAuth = true;
        system.defaults = {
          # Dock
          dock.autohide = true;
          dock.mru-spaces = false;
          dock.largesize = 128;
          dock.tilesize = 32;
          dock.magnification = true;

          # Finder
          finder.FXPreferredViewStyle = "clmv";

          # Screenshots
          screencapture.location = "~/Pictures/screenshots";

          # Login screen
          screensaver.askForPasswordDelay = 10;
          loginwindow.LoginwindowText = "Hacker PC :)";

          # Keyboard config 
          NSGlobalDomain.KeyRepeat = 1;
          NSGlobalDomain.InitialKeyRepeat = 10;
          NSGlobalDomain.ApplePressAndHoldEnabled = true;

          # Mouse
          NSGlobalDomain."com.apple.swipescrolldirection" = true;

          # Bar
          menuExtraClock.ShowSeconds = true;

          # General
          NSGlobalDomain.AppleMetricUnits = 0;
          NSGlobalDomain.AppleMeasurementUnits = "Centimeters";
          NSGlobalDomain.AppleTemperatureUnit = "Celsius";
        };
        system.keyboard.enableKeyMapping = true;
        system.keyboard.remapCapsLockToControl = true;


        homebrew = import ./brew.nix;
      };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#Juans-MacBook-Pro
      darwinConfigurations."Juans-MacBook-Pro" = nix-darwin.lib.darwinSystem {
        modules = [ configuration ];
      };

      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations."Juans-MacBook-Pro".pkgs;
    };
}
