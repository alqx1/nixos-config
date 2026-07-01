{ pkgs, ... }:

{
  boot.loader.systemd-boot.enable = false;
  boot.loader.grub.enable = false;

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.limine = {
    enable = true;
    secureBoot.enable = true;
    extraEntries = ''
      /Windows
        protocol: efi_chainload
        image_path: guid(dd845c3b-3a93-4484-97e4-03c5c5eda3a5):/EFI/Microsoft/Boot/bootmgfw.efi
    '';

    maxGenerations = 5;
  };


  environment.systemPackages = with pkgs; [
    sbctl
  ];
}
