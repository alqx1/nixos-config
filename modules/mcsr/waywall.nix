{ pkgs, ... }:

{
  home.packages = with pkgs; [
    waywall
  ];

  xdg.configFile."waywall".source = ../../config/waywall;
}
