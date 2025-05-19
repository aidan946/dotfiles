{ config, pkgs, ... }:

{
  home.homeDirectory = "/home/aidan";

  imports = [ ../nix/common.nix ];

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; 
    [
      hyprpaper
      waybar
      gimp3
      wl-clipboard
      sqlite
      webcord
  ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
  };

  programs.git = {
    enable = true;
    userName = "Aidan";
    userEmail = "aidanstevens90@gmail.com";
  };

  programs.home-manager.enable = true;
}
