{
  pkgs,
  config,
  ...
}: let
  catppuccinLatte = pkgs.catppuccin-gtk.override {
    accents = ["lavender"];
    size = "compact";
    tweaks = ["rimless"];
    variant = "latte";
  };
  catppuccin-papirus-latte = pkgs.catppuccin-papirus-folders.override {
    accent = "lavender";
    flavor = "latte";
  };
in {
  imports = [
    ./anyrun
    ./browsers/chromium.nix
    #    ./browsers/firefox.nix
    ./browsers/zen.nix
    ./catppuccin.nix
    ./media
    ./gtk.nix
    ./office
    ./qt.nix
  ];

  home.packages = with pkgs; [
    telegram-desktop
    micro
    fastfetch
    intel-gpu-tools
    openssl
    glib-networking
    gnutls
    nautilus
    xfce.thunar
    catppuccinLatte
    catppuccin-papirus-latte
    adwaita-icon-theme

    gnome-calculator
    gnome-control-center

    overskride
    resources
    wineWowPackages.wayland
  ];

  # Create the systemd user service to symlink the theme files
  systemd.user.services = {
    symlink-catppuccin-latte = {
      Unit.Description = "Symlink catppuccin latte theme files to ~/.config/gtk-4.0";
      Service = {
        Type = "simple";
        ExecStartPre = "${pkgs.coreutils}/bin/ln -snf ${catppuccinLatte}/share/themes/catppuccin-latte-lavender-compact+rimless/gtk-4.0/assets ${config.home.homeDirectory}/.config/gtk-4.0/assets";
        ExecStart = "${pkgs.coreutils}/bin/ln -snf ${catppuccinLatte}/share/themes/catppuccin-latte-lavender-compact+rimless/gtk-4.0/gtk.css ${config.home.homeDirectory}/.config/gtk-4.0/gtk.css";
        ExecStartPost = "${pkgs.coreutils}/bin/ln -snf ${catppuccinLatte}/share/themes/catppuccin-latte-lavender-compact+rimless/gtk-4.0/gtk-dark.css ${config.home.homeDirectory}/.config/gtk-4.0/gtk-dark.css";
        TimeoutStopSec = 5;
      };
    };
  };

  # Create the systemd timer to trigger symlink service every day at 18:00
  systemd.user.timers = {
    symlink-catppuccin-latte = {
      Unit.Description = "latte timer";
      Timer.OnCalendar = ["*-*-* 06:00:00"];
      Install.WantedBy = ["graphical-session.target"];
    };
  };
}
