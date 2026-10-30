{
    description = "My NixOs Configurations";

    inputs = {
        nixpkgs.url ="nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, home-manager, ...}:
    {
        nixosConfigurations = {
            framework = nixpkgs.lib.nixosSystem {
                modules = [
                    ./hosts/framework
                    home-manager.nixosModules.home-manager
                    {
                        home-manager = {
                            useGlobalPkgs = true;
                            useUserPackages = true;
                            users.nathan = import ./modules/home-manager/framework.nix;
                            backupFileExtension = "backup";
                        };
                    }
                ];
            };

            desktop = nixpkgs.lib.nixosSystem {
                modules = [
                    ./hosts/desktop
                    home-manager.nixosModules.home-manager
                    {
                        home-manager = {
                            useGlobalPkgs = true;
                            useUserPackages = true;
                            users.nathan = import ./modules/home-manager/desktop.nix;
                            backupFileExtension = "backup";
                        };
                    }
                ];
            };
        };
    };
}
