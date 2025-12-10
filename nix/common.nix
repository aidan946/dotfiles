{ pkgs, ... }:

{
  home.username = "aidan";
  home.stateVersion = "25.05"; # Please read the comment before changing.

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    nerd-fonts.iosevka
    commit-mono
    iosevka
    fira-code
    lilex
    maple-mono.truetype

    libyaml
    libiconv
    openssl_3
    gnupatch
    libpq

    fish
    nushell

    git
    jujutsu
    vim
    neovim
    helix
    emacs
    tmux
    zellij
    starship
    zoxide
    eza
    yazi
    lazygit
    jjui
    lazysql
    carapace
    postgresql
    wget
    ghostscript

    opam
    uv
    nil
    nixfmt-rfc-style

    clang

    tree-sitter
    ripgrep
    fd
    fzf
    imagemagick
    tectonic
    mermaid-cli
    gh
    opencode

    codecrafters-cli
    exercism
  ];

  home.file = {
    ".zshrc".source = ../.zshrc;
    ".config/aerospace".source = ../aerospace;
    ".config/fish/config.fish".source = ../fish/config.fish;
    ".config/ghostty".source = ../ghostty;
    ".config/hypr".source = ../hypr;
    ".config/kitty".source = ../kitty;
    #".config/mise".source = ../mise;
    ".config/nix".source = ../nix;
    ".config/nushell/env.nu".source = ../nushell/env.nu;
    ".config/nushell/config.nu".source = ../nushell/config.nu;
    ".config/nushell/mise.nu".source = ../nushell/mise.nu;
    ".config/nvim".source = ../nvim;
    ".config/starship".source = ../starship;
    ".config/tmux/tmux.conf".source = ../tmux/tmux.conf;
    ".config/waybar".source = ../waybar;
    #".config/zed/keymap.json".source = ../zed/keymap.json;
    #".config/zed/settings.json".source = ../zed/settings.json;
    #".config/zellij".source = ../zellij;
  };

  programs.git = {
    enable = true;
    settings.user = {
      name = "Aidan";
      email = "aidanstevens90@gmail.com";
    };
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
        # diff-editor = "nvim";
      };
    };
  };
}
