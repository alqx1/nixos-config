{ pkgs, ... }:

{
  boot.loader.grub.enable = false;

  boot.loader.systemd-boot.enable = false; # lanzaboote replaces this
    boot.loader.efi.canTouchEfiVariables = true;

  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/etc/secureboot";
  };

  environment.systemPackages = with pkgs; [
    sbctl
  ];
}
