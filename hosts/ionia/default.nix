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

  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_cachyos-lto;

  boot = {
    kernelModules = ["kvm-intel"];
    kernelParams = [
      
    ];
  };

  # nh default flake
  environment.variables.FLAKE = "/home/xaolan/Documents/code/snekbox";

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    EDITOR = "hx";
    TERM = "kitty";
  };

  networking.hostName = "ionia";

  security.tpm2.enable = true;

  services = {
    # for SSD/NVME
    fstrim.enable = true;
    
    # Flatpak support
    flatpak.enable = true;
  };
}
