{ ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      general.import = [
        "./cyberdream.toml"
      ];

      font = {
        normal = {
          family = "SauceCodePro Nerd Font Mono";
          style = "Regular";
        };

        bold = {
          family = "SauceCodePro Nerd Font Mono";
          style = "Bold";
        };

        italic = {
          family = "SauceCodePro Nerd Font Mono";
          style = "Italic";
        };

        bold_italic = {
          family = "SauceCodePro Nerd Font Mono";
          style = "Bold Italic";
        };

        size = 16.0;
      };
    };

  };

  xdg.configFile."alacritty/cyberdream.toml".source =
    ../config/alacritty/cyberdream.toml;
}
