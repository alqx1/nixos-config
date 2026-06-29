{
  description = "default flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mangowm = {
      url = "github:mangowm/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, mangowm, ... }@inputs: {
    nixosConfigurations = {
      muca-nix = nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/muca-nix/configuration.nix
          home-manager.nixosModules.home-manager
          mangowm.nixosModules.mango
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.alex = import ./home/alex.nix;
          }
        ];
      };
    };
  };
}
