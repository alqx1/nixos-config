{ pkgs, ... }:

{
    imports = [
        ../../modules/alacritty.nix
        ../../modules/nvim.nix
        ../../modules/wofi.nix
        ../../modules/niri_laptop.nix
        ../../modules/tmux.nix
        ../../modules/zsh.nix
        ../../modules/awww.nix
        ../../modules/git.nix
    ];

    home.username = "alex";
    home.homeDirectory = "/home/alex";

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

    home.pointerCursor = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 12;
    };

    programs.firefox.enable = true;

    home.packages = with pkgs; [
      wineWow64Packages.staging
      lazygit
    ];

    home.stateVersion = "26.05";
}
