{
  programs.ghostty = {
    enable = true;
    package = null;
    systemd.enable = false;
    settings = {
      font-family = "Maple Mono";
      font-style = "Regular";
      font-size = 16;
      font-feature = "cv31,cv32,cv33,cv34,cv35,cv36,cv37,cv38,cv66,ss03,ss10,ss11";

      background-opacity = 0.9;
      background-blur-radius = 32;

      theme = "Catppuccin Mocha";
      window-padding-x = 8;
      window-padding-y = 8;

      shell-integration-features = "ssh-env";

      keybind = [
        "global:cmd+grave_accent=toggle_quick_terminal"
        "shift+enter=text:\n"
      ];

    };
  };
}
