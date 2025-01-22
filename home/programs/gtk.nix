{
  lib,
  pkgs,
  config,
  ...
}: let
  catppuccinMocha = pkgs.catppuccin-gtk.override {
    accents = ["lavender"]; # You can specify multiple accents here to output multiple themes
    size = "compact";
    tweaks = ["rimless"]; # You can also specify multiple tweaks here
    variant = "mocha";
  };
in {
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
      # package = pkgs.adwaita-icon-theme;
    };

    theme = {
      name = "catppuccin-latte-lavender-compact+rimless";
      package = catppuccinMocha; # Use the overridden catppuccin-latte variant here
    };
  };

  xdg.configFile."gtk-4.0/gtk.css".enable = lib.mkForce false;
}
