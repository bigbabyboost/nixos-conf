{pkgs, ...}: {
  programs.mpv = {
    enable = true;
    defaultProfiles = ["fast"];
    scripts = with pkgs.mpvScripts; [
      mpris
      sponsorblock
      thumbnail
    ];
    config = {
      hwdec = "auto-safe";
      vo = "gpu";
      gpu-context = "wayland";
    };
  };
}
