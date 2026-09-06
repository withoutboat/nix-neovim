{ ... }:
{
  plugins = {
    # Git signs in signcolumn
    gitsigns = {
      enable = true;
      settings = {
        current_line_blame = false;
      };
    };

    # Conflict marker visualization & resolution
    git-conflict = {
      enable = true;
      settings = {
        default_mappings = true;
        disable_diagnostics = false;
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>gb";
      action = "<cmd>Gitsigns blame_line<CR>";
      options.desc = "Git blame line";
    }
    {
      mode = "n";
      key = "<leader>gd";
      action = "<cmd>Gitsigns diffthis<CR>";
      options.desc = "Git diff";
    }
  ];
}
