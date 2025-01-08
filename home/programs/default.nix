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
    tdesktop
    micro
    fastfetch

    gnome-calculator
    gnome-control-center

    overskride
    resources
    wineWowPackages.wayland

  ];
}
