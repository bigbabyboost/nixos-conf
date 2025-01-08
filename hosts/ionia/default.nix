{
  pkgs,
  self,
  # inputs,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./powersave.nix
    ./disk-configuration.nix
  ];

  age.secrets.spotify = {
    file = "${self}/secrets/spotify.age";
    owner = "xaolan";
    group = "users";
  };

  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_latest;

  boot = {
    kernelModules = ["kvm-intel"];
    kernelParams = [
      
    ];
  };

  # nh default flake
  environment.variables.FLAKE = "/home/xaolan/Documents/code/snekbox";

  networking.hostName = "ionia";

  security.tpm2.enable = true;

  services = {
    # for SSD/NVME
    fstrim.enable = true;
    
    # Flatpak support
    flatpak.enable = true;
  };
}
