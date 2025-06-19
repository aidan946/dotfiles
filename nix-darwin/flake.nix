{
  description = "Aidan nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager}:
  let
    configuration = { pkgs, config, ... }: {

      nixpkgs.config.allowUnfree = true;
      environment.systemPackages = with pkgs;
      [
        yabai
      ];


      system.primaryUser = "aidan";
      users.users.aidan.home = "/Users/aidan";

      system.defaults = {
        dock.autohide  = true;
        finder.FXPreferredViewStyle = "clmv";
        NSGlobalDomain.AppleInterfaceStyle = "Dark";
        NSGlobalDomain.KeyRepeat = 2;
        NSGlobalDomain.InitialKeyRepeat = 15;
      };

      nix.settings.experimental-features = "nix-command flakes";
      system.configurationRevision = self.rev or self.dirtyRev or null;
      system.stateVersion = 6;
      nixpkgs.hostPlatform = "aarch64-darwin";

      home-manager.backupFileExtension = "backup";
    };
  in
  {
    # Build darwin flake using:
    darwinConfigurations."aidan" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [ 
          configuration
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
