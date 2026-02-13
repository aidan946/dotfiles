{ pkgs, inputs, ... }:

{
  home.homeDirectory = "/home/aidan";

  imports = [ ../nix/common.nix ];

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    libyaml
    gimp3
    wl-clipboard
    sqlite
    swaylock
  ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  programs.home-manager.enable = true;
}
