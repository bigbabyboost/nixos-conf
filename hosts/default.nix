{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations = let
    # shorten paths
    inherit (inputs.nixpkgs.lib) nixosSystem;

    howdy = inputs.nixpkgs-howdy;

    homeImports = import "${self}/home/profiles";

    mod = "${self}/system";
    # get the basic config to build on top of
    inherit (import mod) laptop;

    # get these into the module system
    specialArgs = {inherit inputs self;};
  in {
    ionia = nixosSystem {
      inherit specialArgs;
      modules =
        laptop
        ++ [
          ./ionia
          
          "${mod}/programs/gamemode.nix"
          "${mod}/programs/hyprland.nix"
          "${mod}/programs/games.nix"

          "${mod}/network/spotify.nix"
          "${mod}/network/syncthing.nix"

          "${mod}/services/gnome-services.nix"
          "${mod}/services/location.nix"

          {
            home-manager = {
              users.xaolan.imports = homeImports."xaolan@ionia";
              extraSpecialArgs = specialArgs;
              backupFileExtension = ".hm-backup";
            };
          }

          inputs.agenix.nixosModules.default
          inputs.chaotic.nixosModules.default
          inputs.disko.nixosModules.default
        ];
    };
  };
}
