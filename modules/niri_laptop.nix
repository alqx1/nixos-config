{ ... }:

{
  programs.zsh = {
    profileExtra = ''
      [ "$(tty)" = "/dev/tty1" ] && exec niri-session -l
    '';
  };

  xdg.configFile."niri".source = ../config/niri/laptop;
}
