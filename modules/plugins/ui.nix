{ ... }:
{
  # Colorscheme: tokyonight night style with transparent background
  colorschemes.tokyonight = {
    enable = true;
    settings = {
      style = "night";
      transparent = true;
      terminal_colors = true;
      styles = {
        comments.italic = true;
        keywords.italic = true;
        sidebars = "dark";
        floats = "dark";
      };
    };
  };

  plugins = {
    # File icons
    web-devicons.enable = true;

    # Status line
    lualine = {
      enable = true;
      settings = {
        options = {
          theme = "tokyonight";
          icons_enabled = true;
          section_separators = {
            left = "";
            right = "";
          };
          component_separators = {
            left = "";
            right = "";
          };
        };
      };
    };

    # Tabs / Bufferline
    bufferline = {
      enable = true;
      settings = {
        options = {
          mode = "tabs";
          separator_style = "slant";
          always_show_bufferline = false;
          show_buffer_close_icons = false;
          show_close_icon = false;
          color_icons = true;
        };
      };
    };
  };
}

