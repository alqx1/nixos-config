{ pkgs, ... }:

{
  boot.loader.limine = {
    enable = true;
    secureBoot.enable = true;
  };

  environment.systemPackages = with pkgs; [
    sbctl
  ];
}
