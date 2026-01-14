{ pkgs, ... }:

{
  home.username = "aidan";
  home.stateVersion = "25.11"; # Please read the comment before changing.

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    maple-mono.truetype

    libyaml
    libiconv
    openssl_3
    gnupatch
    libpq

    fish

    git
    jujutsu
    vim
    neovim
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
    nixfmt

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
    ".config/fish/themes/tokyonight_moon.fish".source = ../fish/themes/tokyonight_moon.fish;
    ".config/ghostty".source = ../ghostty;
    ".config/kitty".source = ../kitty;
    ".config/niri".source = ../niri;
    ".config/nvim".source = ../nvim;
    ".config/starship".source = ../starship;
    ".config/tmux/tmux.conf".source = ../tmux/tmux.conf;
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
        diff-editor = "nvim";
      };
    };
  };
}
