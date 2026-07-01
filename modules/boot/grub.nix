{ ... }:

{
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";
    theme = ../../config/grub/MilkGrub;
    useOSProber = true;

    gfxmodeEfi = "1920x1080,auto";
    gfxpayloadEfi = "keep";
    fontSize = 32;
  };
}
