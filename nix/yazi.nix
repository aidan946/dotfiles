{ pkgs, ... }:
let
  catppuccinMochaRosewater = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/catppuccin/yazi/refs/heads/main/themes/mocha/catppuccin-mocha-rosewater.toml";
    hash = "sha256-dzyBEt2clhuCjZIJCn4MLjZuc35EZOMuqb/9uV9BXrc=";
  };
in
{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    theme = fromTOML (builtins.readFile "${catppuccinMochaRosewater}");
  };
}
