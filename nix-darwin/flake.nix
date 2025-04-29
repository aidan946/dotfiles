{
  description = "Aidan nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, homebrew-core , homebrew-cask, home-manager}:
  let
    configuration = { pkgs, config, ... }: {

      nixpkgs.config.allowUnfree = true;

      environment.systemPackages =
        [
            pkgs.libyaml
            pkgs.libiconv
            pkgs.openssl_3
            pkgs.gnupatch

            pkgs.fish
            pkgs.git
            pkgs.vim
            pkgs.neovim
            pkgs.tmux
            pkgs.mise
            pkgs.starship
            pkgs.zoxide
            pkgs.yazi
            pkgs.lazygit
            pkgs.opam
            pkgs.pngpaste
            pkgs.wget
            pkgs.clang
            pkgs.ripgrep
            pkgs.fd
            pkgs.fzf
            pkgs.eza
            pkgs.zellij
            pkgs.helix
            pkgs.codecrafters-cli
            pkgs.exercism

            pkgs.obsidian
        ];

      homebrew = {
        enable = true;
        brews = [
            "yabai"
        ];
        casks = [
        ];
      };

      system.defaults = {
        dock.autohide  = true;
        finder.FXPreferredViewStyle = "clmv";
        NSGlobalDomain.AppleInterfaceStyle = "Dark";
        NSGlobalDomain.KeyRepeat = 2;
      };

      nix.settings.experimental-features = "nix-command flakes";
      programs.fish.enable = true;
      system.configurationRevision = self.rev or self.dirtyRev or null;
      system.stateVersion = 6;
      nixpkgs.hostPlatform = "aarch64-darwin";

      users.users.aidan.home = "/Users/aidan";
      home-manager.backupFileExtension = "backup";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Aidans-MacBook-Pro
    darwinConfigurations."aidan" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [ 
          configuration
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = "aidan";

              taps = {
                "homebrew/homebrew-core" = homebrew-core;
                "homebrew/homebrew-cask" = homebrew-cask;
              };

              autoMigrate = true;
            };
          }
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.aidan = import ./home.nix;
          }
      ];
    };
  };
}
