{ pkgs, lib, ... }:

{
  home.username = "aidan";
  home.stateVersion = "26.05"; # Please read the comment before changing.

  xdg.enable = true;
  fonts.fontconfig.enable = true;
  programs.man.generateCaches = lib.mkIf pkgs.stdenv.isDarwin false;

  home.packages = with pkgs; [
    maple-mono.truetype
    nerd-fonts.fira-code

    cmake
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
    yazi
    zoxide

    pixi
    nixd
    nixfmt
    opam

    ast-grep
    fd
    fzf
    ripgrep
    tree-sitter

    codecrafters-cli
    exercism
  ];

  home.file = {
    ".config/doom".source = ../doom;
    ".config/nvim/after".source = ../nvim/after;
    ".config/nvim/lua".source = ../nvim/lua;
    ".config/nvim/plugin".source = ../nvim/plugin;
    ".config/nvim/snippets".source = ../nvim/snippets;
    ".config/nvim/init.lua".source = ../nvim/init.lua;
  };

  imports = [
    ./fish.nix
    ./ghostty.nix
    ./kitty.nix
    ./nushell.nix
    ./starship.nix
    ./tmux.nix
    ./yazi.nix
    ./zsh.nix
  ];

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
