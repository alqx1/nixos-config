{
  description = "default flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      muca-laptop = nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/muca-laptop/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.alex = import ./home/muca-laptop/alex.nix;
          }
        ];
      };

      muca-pc = nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/muca-pc/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.alex = import ./home/muca-pc/alex.nix;
          }

          ({ pkgs, ... }: {
             nixpkgs.overlays = [
               (final: prev: {
                  ninb = final.callPackage ./pkgs/ninb.nix { };
                })
             ];
          })
        ];
      };
    };
  };
}
