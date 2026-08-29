{
  description = "flake for my laptop";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, nixos-hardware, home-manager, ...}: {
    nixosConfigurations.nixosFW12 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ 
        ./configuration.nix 
        nixos-hardware.nixosModules.framework-12-13th-gen-intel
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.sabrin = import ./home.nix;
            backupFileExtension = "backup";
          };
        }
      ];
    };
  };
}
