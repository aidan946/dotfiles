{
  description = "Home Manager configuration of aidan";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri-flake = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    @inputs{
      nixpkgs,
      home-manager,
      niri-flake,
      noctalia,
      ... 
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixpkgs.overlays = [ niri-flake.overlays.niri ];
      home-manager.useGlobalPkgs = true;
      homeConfigurations."aidan" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [ ./home.nix ];
      };
      home-manager.extraSpecialArgs = { inherit inputs; };
      home-manager.backupFileExtension = "backup";
        home-manager.sharedModules = [
          niri-flake.homeModules.niri
          noctalia.homeModules.default
        ];
    };
}
