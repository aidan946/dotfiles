{ pkgs, inputs, ... }:

{
  home.homeDirectory = "/home/aidan";

  imports = [ ../nix/common.nix ];

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    gimp3
    wl-clipboard
    sqlite
    mise
    nodejs_25
    bun
    odin
    ruby
    fuzzel
    swaylock
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    kdePackages.isoimagewriter
  ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };

  programs.noctalia-shell = {
    enable = true;
  };


  programs.home-manager.enable = true;
}
