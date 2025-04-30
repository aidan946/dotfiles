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

path add "/opt/homebrew/bin:$PATH"
path add "/home/linuxbrew/.linuxbrew/bin:$PATH"
path add "/usr/local/bin:$PATH"
path add "/home/aidan/.cargo/bin:$PATH"
path add "/Users/aidan/.cargo/bin:$PATH"
path add "/usr/local/opt/openssl@1.1/bin:$PATH"
path add "/Users/aidan/Library/pnpm:$PATH"
path add "/Users/aidan/anaconda3/bin:$PATH"
path add "/Users/aidans/.tmuxifier/bin:$PATH"
path add "$HOME/.emacs.d/bin:$PATH"
path add "$HOME/go/bin:$PATH"
path add "$HOME/.cargo/bin:$PATH"
path add "/home/aidan/.local/share/bob/nvim-bin:$PATH"
path add "/Users/aidan/.local/share/bob/nvim-bin:$PATH"
path add "/home/aidan/.cache/rebar3/bin:$PATH"
path add "/home/aidan/.modular/pkg/packages.modular.com_max/bin:$PATH"
path add "/home/aidan/.modular/pkg/packages.modular.com_mojo/bin:$PATH"
path add "/Users/aidan/projects/ngrrram/target/release:$PATH")
path add "/Users/aidan/.config/emacs/bin:$PATH"
path add "/home/aidan/.config/emacs/bin:$PATH"
path add "/home/aidan/builds/flutter/bin:$PATH"
path add "/Users/aidan/builds/flutter/bin:$PATH"
path add "/Users/aidan/.opam/default/bin:$PATH"

$env.CARAPACE_BRIDGES = "zsh,fish,bash,inshellisense" # optional
mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu

zoxide init nushell | save -f ~/.zoxide.nu

$env.AWS_REGION = "ap-southeast-2"
