{ pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;

    extraPackages = with pkgs; [
      intel-media-driver
      vpl-gpu-rt
    ];
  };

  environment.systemPackages = with pkgs; [
    mesa-demos
    libva-utils
    vulkan-tools
    drm_info
  ];
}
