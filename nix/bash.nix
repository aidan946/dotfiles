{ config, ... }:

{
  programs.bash = {
    enable = true;

    shellAliases = {
      cd = "z";
      ls = "eza";
    };

    initExtra = ''
      source <(carapace _carapace bash)

      eval "$(/opt/homebrew/bin/brew shellenv)"

      eval "$(mise activate bash --shims)"
      eval "$(mise activate bash)"
      eval "$(mise hook-env -s bash)"

      eval "$(zoxide init bash)"
      eval "$(opam env)"
    '';
  };

  programs.starship.enableBashIntegration = true;
}
