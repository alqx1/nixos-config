{ pkgs, ... }:

{
  imports = [
    ./waywall.nix
  ];

  home.packages = with pkgs; [
    prismlauncher
    ninb
  ];
}
