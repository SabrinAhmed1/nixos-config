{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };
  outputs = { self, nixpkgs, nixos-hardware}: {
    nixosConfigurations.nixosFW12 = nixpkgs.lib.nixosSystem {
      modules = [ 
        ./configuration.nix 
        nixos-hardware.nixosModules.framework-12-13th-gen-intel
      ];
    };
  };
}
