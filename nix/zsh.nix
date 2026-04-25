{ config, ... }:

{
  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";
    enableCompletion = true;
    setOptions = [ "CORRECT" ];

    oh-my-zsh = {
      enable = true;
      theme = "";
      plugins = [
        "git"
        "colored-man-pages"
        "command-not-found"
      ];
      extraConfig = ''
        zstyle ':omz:update' mode reminder
      '';
    };

    autosuggestion.enable = true;

    syntaxHighlighting = {
      enable = true;
      highlighters = [
        "brackets"
        "pattern"
        "cursor"
      ];
    };

    initContent = ''
      eval "$(/opt/homebrew/bin/brew shellenv)"

      eval "$(mise activate zsh --shims)"
      eval "$(mise activate zsh)"
      eval "$(mise hook-env -s zsh)"

      eval "$(zoxide init zsh)"
      eval "$(opam env)"
    '';
  };

  programs.starship.enableZshIntegration = true;
}
