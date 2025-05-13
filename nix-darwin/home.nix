{ config, pkgs, ... }:

{
  home.username = "aidan";
  home.homeDirectory = "/Users/aidan";
  home.stateVersion = "25.05"; # Please read the comment before changing.


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".zshrc".source = ../.zshrc;
    ".config/fish".source = ../fish;
    ".config/doom".source = ../doom;
    ".config/ghostty".source = ../ghostty;
    ".config/gitui".source = ../gitui;
    ".config/helix".source = ../helix;
    ".config/mise".source = ../mise;
    ".config/nix".source = ../nix;
    ".config/nix-darwin".source = ../nix-darwin;
    ".config/nushell".source = ../nushell;
    ".config/nvim".source = ../nvim;
    ".config/skhd".source = ../skhd;
    ".config/starship".source = ../starship;
    ".config/tmux".source = ../tmux;
    ".config/wezterm".source = ../wezterm;
    ".config/yabai".source = ../yabai;
    ".config/yazi".source = ../yazi;
    ".config/zed".source = ../zed;
    ".config/zellij".source = ../zellij;
  };
  programs.home-manager.enable = true;
}
