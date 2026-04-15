{ pkgs, ... }:

{
  home.username = "aidan";
  home.stateVersion = "25.11"; # Please read the comment before changing.

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    maple-mono.truetype
    nerd-fonts.fira-code

    cmake
    clang
    gnupatch
    libiconv
    libpq
    libyaml
    openssl_3

    fish
    nushell

    carapace
    eza
    git
    jjui
    jujutsu
    lazysql
    lazygit
    neovim
    starship
    tmux
    vim
    wget
    yazi
    zellij
    zoxide

    pixi
    nixd
    nixfmt
    opam

    ast-grep
    fd
    fzf
    gh
    ghostscript
    imagemagick
    mermaid-cli
    ripgrep
    tectonic
    tree-sitter

    codecrafters-cli
    exercism
  ];

  home.file = {
    ".zshrc".source = ../.zshrc;
    ".config/aerospace".source = ../aerospace;
    ".config/doom".source = ../doom;
    ".config/fish/config.fish".source = ../fish/config.fish;
    ".config/fish/themes/tokyonight.fish".source = ../fish/themes/tokyonight_moon.fish;
    ".config/ghostty".source = ../ghostty;
    ".config/kitty".source = ../kitty;
    ".config/nvim/after".source = ../nvim/after;
    ".config/nvim/lua".source = ../nvim/lua;
    ".config/nvim/plugin".source = ../nvim/plugin;
    ".config/nvim/snippets".source = ../nvim/snippets;
    ".config/nvim/init.lua".source = ../nvim/init.lua;
    ".config/nushell/config.nu".source = ../nushell/config.nu;
    ".config/nushell/env.nu".source = ../nushell/env.nu;
    ".config/starship".source = ../starship;
    ".config/tmux/tmux.conf".source = ../tmux/tmux.conf;
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
