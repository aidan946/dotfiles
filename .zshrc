# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Move to zprofile
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(/opt/homebrew/bin/brew shellenv)"

eval "$(mise activate zsh --shims)" # should be first
eval "$(mise activate zsh)"
eval "$(mise hook-env -s zsh)"

ZSH_THEME=""

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

plugins=(
    git
    colored-man-pages
    command-not-found
    zsh-autosuggestions
    zsh-syntax-highlighting
)


ZSH_HIGHLIGHT_HIGHLIGHTERS+=(brackets pattern cursor)

export AWS_REGION="ap-southeast-2"

export PATH="$HOME/.tmuxifier/bin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
export MODULAR_HOME="$HOME/.modular"
export PATH="$MODULAR_HOME/pkg/packages.modular.com_max/bin:$PATH"
export PATH="/home/aidan/.modular/pkg/packages.modular.com_mojo/bin:$PATH"
export PATH="/User/aidan/.local/share/bob/nvim-bin:$PATH"
export PATH="$HOME/.cache/rebar3/bin:$PATH"
export PATH="$PATH:/Users/aidan/.dotnet/tools:$PATH"

# ~.zshrc
export ZSH=~/.oh-my-zsh

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac


export EDITOR=nvim
export VISUAL="$EDITOR"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
# bun
export PATH="$HOME/.bun/bin:$PATH"

source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(opam env)"
