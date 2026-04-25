{ ... }:

{
  home.homeDirectory = "/Users/aidan";

  imports = [
    ../nix/common.nix
    ../nix/aerospace.nix
  ];

  programs.home-manager.enable = true;
}
