{lib, ...}:
with lib; {
  options.theme = {
    wallpaper = mkOption {
      type = types.path;
      description = ''
        Wallpaper image.
      '';
      default = "";
    };
  };
}
