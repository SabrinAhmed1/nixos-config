{self, inputs, ...}: {
    flake.nixosConfigurations.nixosFW12 = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ 
            self.nixosModules.nixosFW12Configuration 
            inputs.nixos-hardware.nixosModules.framework-12-13th-gen-intel
            inputs.home-manager.nixosModules.home-manager
            {
                home-manager = {
                    useGlobalPkgs = true;
                    useUserPackages = true;
                    users.sabrin = {
                        imports = [
                            self.homeManagerModules.nixosFW12HomeConfiguration
                        ];
                    };
                    backupFileExtension = "backup";
                };
            }
      ];
    };
}