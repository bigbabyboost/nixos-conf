{
  inputs,
  pkgs,
  cinfig,
  lib,
  ...
}: {
  # add the home manager module
  imports = [inputs.ags.homeManagerModules.default];

  home.packages = with pkgs; [
    inputs.self.packages.${pkgs.system}.bun-baseline
    dart-sass
    coreutils
    gawk
    procps
    sassc
    inotify-tools
    imagemagick
    util-linux
    hyprshade
    hyprpicker
    swww
  ];

  programs.ags = {
    enable = true;

    # null or path, leave as null if you don't want hm to manage the config
    configDir = inputs.ags-dots;

    # additional packages to add to gjs's runtime
    extraPackages = with pkgs; [
      libgtop
      gtksourceview
      webkitgtk
      accountsservice
      overskride
      resources
      wlogout
    ];
  };
  systemd.user.services.ags = {
    Unit = {
      Description = "Aylur's Gtk Shell";
      PartOf = [
        "tray.target"
        "graphical-session.target"
      ];
      After = "graphical-session.target";
    };
    Service = {
      Environment = "XDG_SESSION_TYPE=wayland";
      ExecStart = "/etc/profiles/per-user/xaolan/bin/ags";
      Restart = "on-failure";
    };
    Install.WantedBy = ["graphical-session.target"];
  };
}
