{ self, inputs, ... }: {
    flake.nixosModules.kitty = {pkgs, lib, config, ...}: {
        environment.systemPackages = [
            self.packages.${pkgs.stdenv.hostPlatform.system}.myKitty
        ];
        
    };

    perSystem = { pkgs, lib, self', ... }: {
        packages.myKitty = inputs.wrapper-modules.wrappers.kitty.wrap {
            inherit pkgs;
            font.name = "Monocraft";
            font.size = 10;
            settings = {
                scrollback_lines = 10000;
                enable_audio_bell = false;
                update_check_interval = 0;
            };
            keybindings = { 
                "ctrl+c" = "copy_or_interrupt";
                "ctrl+f>2" = "set_font_size 20";
            };

            mouseBindings = {
                "ctrl+left click" = "ungrabbed mouse_handle_click selection link prompt";
                "left click" = "ungrabbed no-op";
            };
            themeFile = "everforest_dark_hard";
        };
    };
    
}