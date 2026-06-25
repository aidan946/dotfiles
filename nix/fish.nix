{
  programs.fish = {
    enable = true;
    shellAliases = {
      cd = "z";
      ls = "eza";
    };
    interactiveShellInit = ''
      set -g fish_greeting

      fish_config theme choose catppuccin-mocha --color-theme=dark

      carapace _carapace | source
      eval (opam env)
      zoxide init fish | source
      mise activate fish | source
    '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    CARAPACE_BRIDGES = "zsh,fish,bash,inshellisense";
  };

  home.sessionPath = [
    "/opt/homebrew/opt/llvm/bin"
    "$HOME/.nix-profile/bin"
    "$HOME/.nix-profile/etc/bin"
    "$HOME/.local/bin"
    "$HOME/.cabal/bin"
    "$HOME/.ghcup/bin"
  ];
}
