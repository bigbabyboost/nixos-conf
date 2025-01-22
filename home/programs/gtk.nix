{
  lib,
  pkgs,
  config,
  ...
}: let
  catppuccinMocha = pkgs.catppuccin-gtk.override {
    accents = ["lavender"];
    size = "compact";
    tweaks = ["rimless"];
    variant = "mocha";
  };
in {
  # Define the GTK settings
  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
    gtk.enable = true;
    x11.enable = true;
  };

  gtk = {
    enable = true;

    font = {
      name = "Inter";
      package = pkgs.google-fonts.override {fonts = ["Inter"];};
      size = 9;
    };

    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";

    iconTheme = {
      name = "Papirus-Dark";
    };

    theme = {
      name = "catppuccin-latte-lavender-compact+rimless";
      package = catppuccinMocha;
    };
  };

  # Create the systemd user service to symlink the theme files
  systemd.user.services = {
    symlink-catppuccin-mocha = {
      Unit.Description = "Symlink catppuccin mocha theme files to ~/.config/gtk-4.0";
      Service = {
        Type = "simple";
        ExecStartPre = "${pkgs.coreutils}/bin/ln -snf ${catppuccinMocha}/share/themes/catppuccin-mocha-lavender-compact+rimless/gtk-4.0/assets ${config.home.homeDirectory}/.config/gtk-4.0/assets";
        ExecStart = "${pkgs.coreutils}/bin/ln -snf ${catppuccinMocha}/share/themes/catppuccin-mocha-lavender-compact+rimless/gtk-4.0/gtk.css ${config.home.homeDirectory}/.config/gtk-4.0/gtk.css";
        ExecStartPost = "${pkgs.coreutils}/bin/ln -snf ${catppuccinMocha}/share/themes/catppuccin-mocha-lavender-compact+rimless/gtk-4.0/gtk-dark.css ${config.home.homeDirectory}/.config/gtk-4.0/gtk-dark.css";
        TimeoutStopSec = 5;
      };
    };
  };

  # Create the systemd timer to trigger symlink service every day at 18:00
  systemd.user.timers = {
    symlink-catppuccin-mocha = {
      Unit.Description = "mocha timer";
      Timer.OnCalendar = ["*-*-* 18:00:00"];
      Install.WantedBy = ["graphical-session.target"];
    };
  };

  # Disable default gtk theme css to avoid conflict
  xdg.configFile."gtk-4.0/gtk.css".enable = lib.mkForce false;
  xdg.configFile."gtk-4.0/gtk-dark.css".enable = lib.mkForce false;
}
