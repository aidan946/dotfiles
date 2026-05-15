{ pkgs, ... }:

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
          set -g status-right-length 100
          set -g status-left-length 100
          set -g status-left ""
          set -g status-right "#{E:@catppuccin_status_application}"
          set -ag status-right "#{E:@catppuccin_status_session}"
        '';
      }
      sensible
      pain-control
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
