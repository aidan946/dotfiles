{ ... }:

{
  home.homeDirectory = "/Users/aidan";

  imports = [ ../nix/common.nix ];

  programs.home-manager.enable = true;
}
