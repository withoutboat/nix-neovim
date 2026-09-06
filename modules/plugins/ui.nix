{ ... }:
{
  # Colorscheme
  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "mocha";
      transparent_background = false;
    };
  };

  plugins = {
    # Status line
    lualine.enable = true;

    # Icons
    web-devicons.enable = true;

    # Git signs in signcolumn
    gitsigns.enable = true;

    # Auto close brackets and pairs
    nvim-autopairs.enable = true;
  };
}
