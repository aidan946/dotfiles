{ pkgs, ... }:
let
  catppuccinMochaRosewater = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/catppuccin/yazi/refs/heads/main/themes/mocha/catppuccin-mocha-rosewater.toml";
    hash = "sha256-C1EYRBR7speKEyLWvjZHM4y3eTImx4dspyKS2VsMUdU=";
  };
in
{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    theme = builtins.fromTOML (builtins.readFile catppuccinMochaRosewater);
  };
}
