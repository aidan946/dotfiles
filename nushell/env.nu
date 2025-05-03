# Default Nushell Environment Config File
# These "sensible defaults" are set before the user's `env.nu` is loaded
#
# version = "0.104.1"

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

$env.EDITOR = "nvim"

use std/util "path add"
$env.path ++= ["/opt/homebrew/bin:$PATH",
                "/home/linuxbrew/.linuxbrew/bin:$PATH",
                "/usr/local/bin:$PATH",
                "/home/aidan/.cargo/bin:$PATH",
                "/Users/aidan/.cargo/bin:$PATH",
                "/usr/local/opt/openssl@1.1/bin:$PATH",
                "/Users/aidan/Library/pnpm:$PATH",
                "/Users/aidan/anaconda3/bin:$PATH",
                "/Users/aidans/.tmuxifier/bin:$PATH",
                "$HOME/.emacs.d/bin:$PATH",
                "$HOME/go/bin:$PATH",
                "$HOME/.cargo/bin:$PATH",
                "/home/aidan/.local/share/bob/nvim-bin:$PATH",
                "/Users/aidan/.local/share/bob/nvim-bin:$PATH",
                "/home/aidan/.cache/rebar3/bin:$PATH",
                "/home/aidan/.modular/pkg/packages.modular.com_max/bin:$PATH",
                "/home/aidan/.modular/pkg/packages.modular.com_mojo/bin:$PATH",
                "/Users/aidan/projects/ngrrram/target/release:$PATH",
                "/Users/aidan/.config/emacs/bin:$PATH",
                "/home/aidan/.config/emacs/bin:$PATH",
                "/home/aidan/builds/flutter/bin:$PATH",
                "/Users/aidan/builds/flutter/bin:$PATH",
                "/Users/aidan/.opam/default/bin:$PATH"]

$env.CARAPACE_BRIDGES = "zsh,fish,bash,inshellisense" # optional
mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu

zoxide init nushell | save -f ~/.zoxide.nu
