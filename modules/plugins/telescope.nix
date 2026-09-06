{ ... }:
{
  plugins.telescope = {
    enable = true;

    extensions = {
      file-browser = {
        enable = true;
        settings = {
          theme = "dropdown";
          hijack_netrw = true;
        };
      };
    };

    keymaps = {
      ";f" = {
        action = "find_files";
        options.desc = "Find files";
      };
      ";r" = {
        action = "live_grep";
        options.desc = "Live grep";
      };
      "\\\\" = {
        action = "buffers";
        options.desc = "Find buffers";
      };
      ";t" = {
        action = "help_tags";
        options.desc = "Help tags";
      };
      ";;" = {
        action = "resume";
        options.desc = "Resume telescope";
      };
      ";e" = {
        action = "diagnostics";
        options.desc = "Diagnostics";
      };
    };
  };

  # Keymap for telescope file browser
  keymaps = [
    {
      mode = "n";
      key = "sf";
      action = "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>";
      options = {
        silent = true;
        desc = "Telescope file browser";
      };
    }
  ];
}


