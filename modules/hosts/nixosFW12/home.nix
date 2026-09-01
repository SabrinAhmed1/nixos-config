{self, inputs, ...}: {
flake.homeManagerModules.nixosFW12HomeConfiguration = { config, pkgs, ... }:
  {
    home.username = "sabrin";
    home.homeDirectory = "/home/sabrin";
    programs.git.enable = true;
    home.stateVersion = "26.05";
    programs.bash = {
      enable = true;
    };
  };
}