{pkgs, ...}: {
  # graphics drivers / HW accel
  hardware.graphics = {
    enable = true;

    extraPackages = with pkgs; [
      libva
      intel-media-driver
    ];
    extraPackages32 = with pkgs.pkgsi686Linux; [
      intel-media-driver
    ];
  };
}
