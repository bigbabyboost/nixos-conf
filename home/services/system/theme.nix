{
  lib,
  pkgs,
  ...
}: {
  systemd.user.timers = {
    theme-toggle-dark = {
      Unit.Description = "Toggle dark theme";
      Timer.OnCalendar = [
        "*-*-* 18:00:00"
      ];
      Install.WantedBy = ["graphical-session.target"];
    };
    
    theme-gtk3-dark = {
      Unit.Description = "Toggle dark gtk3 theme";
      Timer.OnCalendar = [
        "*-*-* 18:00:00"
      ];
      Install.WantedBy = ["graphical-session.target"];
    };

    theme-toggle-light = {
      Unit.Description = "Toggle light theme";
      Timer.OnCalendar = [
        "*-*-* 06:00:00"
      ];
      Install.WantedBy = ["graphical-session.target"];
    };
    
    theme-gtk3-light = {
      Unit.Description = "Toggle light gtk3 theme";
      Timer.OnCalendar = [
        "*-*-* 06:00:00"
      ];
      Install.WantedBy = ["graphical-session.target"];
    };
  };

  systemd.user.services = {
    theme-toggle-dark = {
      Unit.Description = "Toggle dark theme";
      Service = {
        Type = "simple";
        ExecStart = "${lib.getExe pkgs.dconf} write /org/gnome/desktop/interface/color-scheme \"'prefer-dark'\"";
        TimeoutStopSec = 5;
      };
    };

    theme-gtk3-dark = {
      Unit.Description = "Toggle dark gtk3 theme";
      Service = {
        Type = "simple";
        ExecStart = "${lib.getExe pkgs.dconf} write /org/gnome/desktop/interface/gtk-theme \"'adw-gtk3-dark'\"";
        TimeoutStopSec = 5;
      };
    };

    theme-toggle-light = {
      Unit.Description = "Toggle light theme";
      Service = {
        Type = "simple";
        ExecStart = "${lib.getExe pkgs.dconf} write /org/gnome/desktop/interface/color-scheme \"'prefer-light'\"";
        TimeoutStopSec = 5;
      };
    };

    theme-gtk3-light = {
      Unit.Description = "Toggle light gtk3 theme";
      Service = {
        Type = "simple";
        ExecStart = "${lib.getExe pkgs.dconf} write /org/gnome/desktop/interface/gtk-theme \"'adw-gtk3'\"";
        TimeoutStopSec = 5;
      };
    };
  };
}
