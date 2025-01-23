{
  pkgs,
  inputs,
  config,
  lib,
  ...
}: {
  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
  ];
  catppuccin = {
    gtk.icon = {
      enable = false;
      accent = "lavender";
      flavor = "mocha";
    };
  };
}
