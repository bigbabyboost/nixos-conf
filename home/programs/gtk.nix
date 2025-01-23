{
  lib,
  pkgs,
  config,
  ...
}: {
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
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };

    theme = {
      name = "adw-gtk3";
      package = pkgs.adw-gtk3;
    };
  };

  # Disable default gtk theme css to avoid conflict
  xdg.configFile."gtk-4.0/gtk.css".enable = lib.mkForce false;
  xdg.configFile."gtk-4.0/gtk-dark.css".enable = lib.mkForce false;
}
