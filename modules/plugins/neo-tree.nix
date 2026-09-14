{ ... }:
{
  plugins = {
    web-devicons.enable = true;

    neo-tree = {
      enable = true;

      settings = {
        close_if_last_window = true;
        popup_border_style = "rounded";

        filesystem = {
          filtered_items = {
            visible = false;
            hide_dotfiles = false;
            hide_gitignored = false;
          };
          follow_current_file = {
            enabled = true;
          };
          use_libuv_file_watcher = true;
        };

        window = {
          width = 30;
          position = "left";
          auto_expand_width = false;
        };
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Neotree toggle<CR>";
      options = {
        silent = true;
        desc = "Toggle Explorer (Neo-tree)";
      };
    }
    {
      mode = "n";
      key = "<leader>o";
      action = "<cmd>Neotree focus<CR>";
      options = {
        silent = true;
        desc = "Focus Explorer (Neo-tree)";
      };
    }
  ];
}
