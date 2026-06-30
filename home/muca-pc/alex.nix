{ config, pkgs, ...}:

{
    imports = [
        ../../modules/alacritty.nix
        ../../modules/nvim.nix
        ../../modules/wofi.nix
        ../../modules/niri_pc.nix
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

    programs.ssh = {
      matchBlocks = {
        "github.com" = {
          hostname = "github.com";
          user = "git";
          identityFile = "~/.ssh/github";
          identitiesOnly = true;
        };
      };
    };

    programs.firefox.enable = true;

    home.packages = with pkgs; [
      pavucontrol
      lazygit
      tmux
      devenv
      prismlauncher
      waywall
      ninb
      wineWow64Packages.staging
    ];

    home.pointerCursor = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 12;
    };

    home.stateVersion = "26.05";
}
