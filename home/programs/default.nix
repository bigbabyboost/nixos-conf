{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./anyrun
    ./browsers/chromium.nix
#    ./browsers/firefox.nix
    ./browsers/zen.nix
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


    gnome-calculator
    gnome-control-center

    overskride
    resources
    wineWowPackages.wayland

  ];
}
