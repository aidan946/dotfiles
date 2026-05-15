{ config, ... }:

{
  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";
    enableCompletion = true;
    setOptions = [ "CORRECT" ];

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
      source <(carapace _carapace zsh)

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
