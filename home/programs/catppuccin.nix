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
      enable = true;
      accent = "lavender";
      flavor = "mocha";
    };
  };
}
