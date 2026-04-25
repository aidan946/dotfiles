{ pkgs, ... }:

let
  tmuxPomodoroPlus = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "tmux-pomodoro-plus";
    version = "main";
    rtpFilePath = "pomodoro.tmux";
    src = pkgs.fetchFromGitHub {
      owner = "olimorris";
      repo = "tmux-pomodoro-plus";
      rev = "main";
      hash = "sha256-pWnfq2yAy9PkXatxto9eRPczoyrNEpA6l9683Q0gWQA=";
    };
  };
in
{
  programs.tmux = {
    enable = true;
    prefix = "C-s";
    mouse = true;
    terminal = "xterm-ghostty";
    focusEvents = true;
    baseIndex = 1;
    escapeTime = 0;
    historyLimit = 1000000;
    keyMode = "vi";

    plugins = with pkgs.tmuxPlugins; [
      {
        plugin = catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavor "mocha"
          set -g @catppuccin_window_status_style "rounded"
        '';
      }
      {
        plugin = tmuxPomodoroPlus;
        extraConfig = ''
          set -g status-right-length 100
          set -g status-left-length 100
          set -g status-left ""
          set -g status-right "#{E:@catppuccin_status_application}"
          set -ag status-right "#{E:@catppuccin_status_session}"
          set -agF status-right "#{E:@catppuccin_status_pomodoro_plus}"
        '';
      }
      sensible
      pain-control
      {
        plugin = tmux-fzf;
        extraConfig = ''
          set -g @fzf-url-fzf-options '-p 60%,30% --prompt="   " --border-label=" Open URL "'
          set -g @fzf-url-history-limit '2000'
        '';
      }
      vim-tmux-navigator
    ];

    extraConfig = ''
      set -g status-position top
      set -g set-clipboard on
      set -g detach-on-destroy off
      set -g renumber-windows on

      bind -n S-left prev
      bind -n S-right next
      bind -n S-down new-window

      bind '"' split-window -v -c "#{pane_current_path}"
      bind '-' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"
      bind '|' split-window -h -c "#{pane_current_path}"

    '';
  };
}
