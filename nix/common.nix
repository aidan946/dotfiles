{ config, pkgs, ... }:

{
  home.username = "aidan";
  home.stateVersion = "25.05"; # Please read the comment before changing.

  fonts.fontconfig.enable = true;

  home.packages = with pkgs;
  [
    nerd-fonts.iosevka
    commit-mono
    iosevka
    fira-code

    libyaml
    libiconv
    openssl_3
    gnupatch

    fish
    nushell
    git
    vim
    neovim
    tmux
    mise
    starship
    zoxide
    yazi
    lazygit
    opam
    wget
    clang
    ripgrep
    fd
    fzf
    eza
    zellij
    helix
    codecrafters-cli
    exercism
    carapace
    emacs
    uv
    postgresql
    tree-sitter
    imagemagick
    tectonic
    mermaid-cli
    jujutsu
    lazyjj
    obsidian
  ];

  home.file = {
    ".zshrc".source = ../.zshrc;
    ".config/doom".source = ../doom;
    ".config/fish".source = ../fish;
    ".config/ghostty".source = ../ghostty;
    ".config/helix".source = ../helix;
    ".config/hypr".source = ../hypr;
    #".config/mise".source = ../mise;
    ".config/nix".source = ../nix;
    ".config/nushell".source = ../nushell;
    ".config/nvim".source = ../nvim;
    ".config/skhd".source = ../skhd;
    ".config/starship".source = ../starship;
    ".config/tmux".source = ../tmux;
    ".config/waybar".source = ../waybar;
    ".config/yabai".source = ../yabai;
    ".config/yazi".source = ../yazi;
    ".config/zed/keymap.json".source = ../zed/keymap.json;
    ".config/zed/settings.json".source = ../zed/settings.json;
    ".config/zellij".source = ../zellij;
  };

  programs.git = {
    enable = true;
    userName = "Aidan";
    userEmail = "aidanstevens90@gmail.com";
  };

  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = "Aidan";
        email = "aidanstevens90@gmail.com";
      };
      ui = {
        default-command = "log";
      };
    };
  };
}
