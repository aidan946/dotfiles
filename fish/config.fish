set -g fish_greeting
alias cd="z"
alias ls=eza
fish_add_path /usr/bin
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx STARSHIP_CONFIG $HOME/.config/starship/starship.toml
set -gx EDITOR nvim

if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -Ux CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense' # optional
carapace _carapace | source
eval (opam env)
starship init fish | source
zoxide init fish | source
mise activate fish | source

