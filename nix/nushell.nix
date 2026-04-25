{ pkgs, ... }:
let
  catppuccinMocha = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/catppuccin/nushell/refs/heads/main/themes/catppuccin_mocha.nu";
    hash = "sha256-i6aHa8EQQYV4x3uEbZevmwteXXj3+4HiW8WwDbcyRgM=";
  };
in
{
  programs.nushell = {
    enable = true;
    settings = {
      show_banner = false;
      buffer_editor = "nvim";
    };

    shellAliases = {
      cd = "z";
    };

    extraConfig = ''
      source ${catppuccinMocha}

      use ($nu.default-config-dir | path join mise.nu)
      mkdir ($nu.data-dir | path join "vendor/autoload")

      source ~/.zoxide.nu
      source $"($nu.cache-dir)/carapace.nu"
    '';

    extraEnv = ''
      mkdir $"($nu.cache-dir)"
      carapace _carapace nushell | save --force $"($nu.cache-dir)/carapace.nu"

      let mise_path = $nu.default-config-dir | path join mise.nu
      ^mise activate nu | save $mise_path --force

      zoxide init nushell | save -f ~/.zoxide.nu
    '';
  };

  programs.starship.enableNushellIntegration = true;
}
