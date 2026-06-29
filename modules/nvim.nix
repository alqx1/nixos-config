{ pkgs, ...}:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      clang-tools
      ripgrep
      fd
      gcc
      nixd
      pkgs.nixfmt
    ];

    plugins = with pkgs.vimPlugins; [
      cyberdream-nvim

      (nvim-treesitter.withPlugins (
        p: [
          p.c
          p.nix
          p.python
        ]
      ))

      mason-nvim
      mason-lspconfig-nvim
      nvim-lspconfig

      nvim-cmp
      cmp-buffer
      cmp-path
      cmp-nvim-lsp

      oil-nvim
      telescope-nvim
      plenary-nvim
      telescope-fzf-native-nvim
    ];
  };

  xdg.configFile."nvim".source = ../config/nvim;
}
