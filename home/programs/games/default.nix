{
  pkgs,
  inputs,
  ...
}:
# games
{
  home.packages = with pkgs; [
    gamescope
    # (lutris.override {extraPkgs = p: [p.libnghttp2];})
    winetricks
  ];
}
