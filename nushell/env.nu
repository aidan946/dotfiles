# Default Nushell Environment Config File
# These "sensible defaults" are set before the user's `env.nu` is loaded
#
# version = "0.109.2"

$env.PROMPT_COMMAND = {||
    let dir = match (do -i { $env.PWD | path relative-to $nu.home-path }) {
        null => $env.PWD
        '' => '~'
        $relative_pwd => ([~ $relative_pwd] | path join)
    }

    let path_color = (if (is-admin) { ansi red_bold } else { ansi green_bold })
    let separator_color = (if (is-admin) { ansi light_red_bold } else { ansi light_green_bold })
    let path_segment = $"($path_color)($dir)(ansi reset)"

    $path_segment | str replace --all (char path_sep) $"($separator_color)(char path_sep)($path_color)"
}

$env.PROMPT_COMMAND_RIGHT = {||
    # create a right prompt in magenta with green separators and am/pm underlined
    let time_segment = ([
        (ansi reset)
        (ansi magenta)
        (date now | format date '%x %X') # try to respect user's locale
    ] | str join | str replace --regex --all "([/:])" $"(ansi green)${1}(ansi magenta)" |
        str replace --regex --all "([AP]M)" $"(ansi magenta_underline)${1}")

    let last_exit_code = if ($env.LAST_EXIT_CODE != 0) {([
        (ansi rb)
        ($env.LAST_EXIT_CODE)
    ] | str join)
    } else { "" }

    ([$last_exit_code, (char space), $time_segment] | str join)
}


$env.config.show_banner = false
$env.config.buffer_editor = "nvim"
$env.EDITOR = "nvim"
$env.config.datetime_format.normal = "%d/%m/%y %I:%M:%S%p"
$env.XDG_CONFIG_HOME = $"($env.home)/.config"
$env.STARSHIP_CONFIG = $"($env.home)/.config/starship/starship.toml"
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional

use std/util "path add"
path add "/opt/homebrew/bin"
path add "/home/linuxbrew/.linuxbrew/bin"
path add "/usr/local/bin"
path add "$HOME/go/bin"
path add "$HOME/.cargo/bin"
path add "/home/aidan/.cache/rebar3/bin"
path add "$HOME/.nix-profile/bin"
path add "$HOME/.ghcup/bin"
path add "$HOME/.nix-profile/etc/bin"
path add "/etc/profiles/per-user/aidan/bin"
path add "/nix/var/nix/profiles/default/bin"
path add "/run/current-system/sw/bin"

mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu

zoxide init nushell | save -f ~/.zoxide.nu
