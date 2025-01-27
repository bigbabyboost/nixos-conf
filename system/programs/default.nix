{
  imports = [
    ./fonts.nix
    ./home-manager.nix
    # ./qt.nix
    ./xdg.nix
    ./gnupg.nix
  ];

  programs = {
    # make HM-managed GTK stuff work
    dconf.enable = true;

    kdeconnect.enable = false;

    seahorse.enable = true;
  };
}
