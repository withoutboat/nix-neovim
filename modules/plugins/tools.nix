{ ... }:
{
  plugins = {
    # Floating terminal
    toggleterm = {
      enable = true;
      settings = {
        size = 20;
        open_mapping = "[[<c-\\>]]";
        hide_numbers = true;
        direction = "float";
        float_opts = {
          border = "curved";
          winblend = 0;
        };
      };
    };

    # Diagnostics and quickfix panel
    trouble = {
      enable = true;
    };
  };

  keymaps = [
    # Trouble keymaps
    {
      mode = "n";
      key = ";tt";
      action = "<cmd>Trouble diagnostics toggle<CR>";
      options = {
        silent = true;
        desc = "Trouble toggle diagnostics";
      };
    }
    {
      mode = "n";
      key = ";tw";
      action = "<cmd>Trouble diagnostics toggle filter.buf=0<CR>";
      options = {
        silent = true;
        desc = "Trouble buffer diagnostics";
      };
    }
    {
      mode = "n";
      key = ";tq";
      action = "<cmd>Trouble qflist toggle<CR>";
      options = {
        silent = true;
        desc = "Trouble quickfix list";
      };
    }
    {
      mode = "n";
      key = ";tl";
      action = "<cmd>Trouble loclist toggle<CR>";
      options = {
        silent = true;
        desc = "Trouble location list";
      };
    }
    {
      mode = "n";
      key = "gR";
      action = "<cmd>Trouble lsp_references toggle<CR>";
      options = {
        silent = true;
        desc = "Trouble LSP references";
      };
    }
  ];
}
