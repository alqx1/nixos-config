{ config, pkgs, ...}:

{
    imports = [
        ../modules/alacritty.nix
        ../modules/nvim.nix
        ../modules/wofi.nix
        ../modules/niri.nix
    ];

    home.username = "alex";
    home.homeDirectory = "/home/alex";

    programs.git = {
        enable = true;
        settings = {
          user.name = "alqx1";
          user.email = "alex.kovac3@gmail.com";
        };
    };

    home.packages = with pkgs; [
      wineWow64Packages.staging
    ];

    home.stateVersion = "26.05";
}
