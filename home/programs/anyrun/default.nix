{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.anyrun.homeManagerModules.default
  ];

  programs.anyrun = {
    enable = true;

    config = {
      plugins = with inputs.anyrun.packages.${pkgs.system}; [
        applications
        randr
        rink
        shell
        symbols
      ];

      width.fraction = 0.25;
      y.fraction = 0.3;
      hidePluginInfo = true;
      closeOnClick = true;
    };

    extraCss = builtins.readFile (./. + "/style-dark.css");

    extraConfigFiles = {
      "applications.ron".text = ''
        Config(
          desktop_actions: false,
          max_entries: 5,
          terminal: Some(Terminal(
          	command: "kitty",
          	args: "-e {}",
          )),
        )
      '';

      "shell.ron".text = ''
        Config(
          prefix: ">"
        )
      '';

      "randr.ron".text = ''
        Config(
          prefi: ":dp",
          max_entries: 5,
        )
      '';
    };
  };
}
