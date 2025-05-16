{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "aidan";
  home.homeDirectory = "/home/aidan";

  home.stateVersion = "25.05"; # Please read the comment before changing.
  fonts.fontconfig.enable = true;
  nixpkgs.config.allowUnfree = true;

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
    vim
    neovim
    tmux
    mise
    hyprpaper
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
    webcord
    emacs
    uv
    obsidian
    waybar
    gimp3
  ];

  home.file = {
    ".zshrc".source = ../.zshrc;
    ".config/doom".source = ../doom;
    ".config/fish".source = ../fish;
    ".config/ghostty".source = ../ghostty;
    ".config/gitui".source = ../gitui;
    ".config/helix".source = ../helix;
    ".config/hypr".source = ../hypr;
    ".config/mise".source = ../mise;
    ".config/nix".source = ../nix;
    ".config/nushell".source = ../nushell;
    ".config/nvim".source = ../nvim;
    ".config/skhd".source = ../skhd;
    ".config/starship".source = ../starship;
    ".config/tmux".source = ../tmux;
    ".config/waybar".source = ../waybar;
    ".config/yabai".source = ../yabai;
    ".config/yazi".source = ../yazi;
    ".config/zed".source = ../zed;
    ".config/zellij".source = ../zellij;
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/aidan/etc/profile.d/hm-session-vars.sh

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

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.git = {
    enable = true;
    userName = "Aidan";
    userEmail = "aidanstevens90@gmail.com";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
