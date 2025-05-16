{ config, pkgs, ... }:

{
        home.packages = with pkgs; = with pkgs;
        [
            libyaml
            libiconv
            openssl_3
            gnupatch

            fish
            nushell
            git
            vim
            neovim
            tmux
            mise
            starship
            zoxide
            yazi
            lazygit
            opam
            pngpaste
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
            emacs
            uv

            obsidian
        ];
}
