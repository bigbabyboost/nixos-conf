{
  pkgs,
  inputs,
  ...
}: let
  catppuccinLatte = pkgs.catppuccin-gtk.override {
    accents = ["lavender"];
    size = "compact";
    tweaks = ["rimless"];
    variant = "latte";
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
    adwaita-icon-theme

    gnome-calculator
    gnome-control-center

    overskride
    resources
    wineWowPackages.wayland
  ];
}
