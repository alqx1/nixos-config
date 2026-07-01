{ config, lib, pkgs, ... }:

{
  imports =
    [
    ./hardware-configuration.nix
    ../../modules/opentabletdriver.nix
    ../../modules/boot/limine.nix
    ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "muca-nix";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Ljubljana";

  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver.xkb.layout = "us";
  services.xserver.xkb.options = "ctrl:nocaps";

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  users.users.alex = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "audio" ];
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    wget
    git
    xwayland-satellite
    xdg-desktop-portal-gtk
    unzip
    brightnessctl
    vim
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    nerd-fonts.sauce-code-pro
  ];

  programs.niri.enable = true;
  programs.zsh.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    package = pkgs.steam.override {
      extraArgs = "-cef-disable-gpu-compositing";
    };
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  services.flatpak.enable = true;
  programs.gamemode.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = false;
  hardware.nvidia.modesetting.enable = true;

  environment.etc."libinput/local-overrides.quirks" = {
    text = ''
      [Disable Mouse Debouncing Quirks]
      MatchName=*
      ModelBouncingKeys=1
    '';
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Don't change
  system.stateVersion = "26.05"; # Did you read the comment?
}
