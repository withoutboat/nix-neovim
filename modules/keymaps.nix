{ ... }:
{
  keymaps = [
    # Clear search highlight
    {
      mode = "n";
      key = "<Esc>";
      action = "<cmd>nohlsearch<CR>";
      options.desc = "Clear search highlights";
    }

    # Insert mode shortcuts
    {
      mode = "i";
      key = "jk";
      action = "<ESC>";
      options.desc = "Exit insert mode";
    }
    {
      mode = "i";
      key = "kj";
      action = "<ESC>";
      options.desc = "Exit insert mode";
    }

    # Window splits
    {
      mode = "n";
      key = "ss";
      action = ":split<Return><C-w>w";
      options = {
        silent = true;
        desc = "Split horizontal";
      };
    }
    {
      mode = "n";
      key = "sv";
      action = ":vsplit<Return><C-w>w";
      options = {
        silent = true;
        desc = "Split vertical";
      };
    }

    # Window navigation
    {
      mode = "n";
      key = "<Space>";
      action = "<C-w>w";
      options.desc = "Next window";
    }
    {
      mode = "n";
      key = "sh";
      action = "<C-w>h";
      options.desc = "Window left";
    }
    {
      mode = "n";
      key = "sj";
      action = "<C-w>j";
      options.desc = "Window down";
    }
    {
      mode = "n";
      key = "sk";
      action = "<C-w>k";
      options.desc = "Window up";
    }
    {
      mode = "n";
      key = "sl";
      action = "<C-w>l";
      options.desc = "Window right";
    }
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
      options.desc = "Navigate to left window";
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
      options.desc = "Navigate to lower window";
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
      options.desc = "Navigate to upper window";
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
      options.desc = "Navigate to right window";
    }

    # Window resizing
    {
      mode = "n";
      key = "<C-w><left>";
      action = "<C-w><";
      options.desc = "Resize window left";
    }
    {
      mode = "n";
      key = "<C-w><right>";
      action = "<C-w>>";
      options.desc = "Resize window right";
    }
    {
      mode = "n";
      key = "<C-w><up>";
      action = "<C-w>+";
      options.desc = "Resize window up";
    }
    {
      mode = "n";
      key = "<C-w><down>";
      action = "<C-w>-";
      options.desc = "Resize window down";
    }

    # Tabs
    {
      mode = "n";
      key = "te";
      action = ":tabedit<Return>";
      options = {
        silent = true;
        desc = "New tab";
      };
    }
    {
      mode = "n";
      key = "tn";
      action = ":tabNext<Return>";
      options = {
        silent = true;
        desc = "Next tab";
      };
    }

    # Bufferline cycle
    {
      mode = "n";
      key = "<Tab>";
      action = "<Cmd>BufferLineCycleNext<CR>";
      options.desc = "Next buffer";
    }
    {
      mode = "n";
      key = "<S-Tab>";
      action = "<Cmd>BufferLineCyclePrev<CR>";
      options.desc = "Previous buffer";
    }

    # Text editing helpers
    {
      mode = "n";
      key = "x";
      action = "\"_x";
      options.desc = "Delete char without copying";
    }
    {
      mode = "n";
      key = "+";
      action = "<C-a>";
      options.desc = "Increment number";
    }
    {
      mode = "n";
      key = "-";
      action = "<C-x>";
      options.desc = "Decrement number";
    }
    {
      mode = "n";
      key = "dw";
      action = "vb\"_d";
      options.desc = "Delete word backwards";
    }
    {
      mode = "n";
      key = "<C-a>";
      action = "gg<S-v>G";
      options.desc = "Select all";
    }
    {
      mode = "v";
      key = "p";
      action = "\"_dP";
      options.desc = "Paste without replacing register";
    }

    # File management & scripts
    {
      mode = "n";
      key = "<leader>x";
      action = ":!chmod +x %<CR>";
      options = {
        silent = true;
        desc = "Make file executable";
      };
    }
    {
      mode = "n";
      key = "<C-f>";
      action = ":silent !tmux neww tmux-sessionizer<CR><CR>";
      options = {
        silent = true;
        desc = "Tmux sessionizer";
      };
    }
    {
      mode = "n";
      key = "<leader>w";
      action = "<cmd>w<CR>";
      options.desc = "Save buffer";
    }
    {
      mode = "n";
      key = "<leader>q";
      action = "<cmd>q<CR>";
      options.desc = "Quit";
    }

    # Move lines in visual mode
    {
      mode = "v";
      key = "J";
      action = ":m '>+1<CR>gv=gv";
      options.desc = "Move line down";
    }
    {
      mode = "v";
      key = "K";
      action = ":m '<-2<CR>gv=gv";
      options.desc = "Move line up";
    }

    # Better indenting in visual mode
    {
      mode = "v";
      key = "<";
      action = "<gv";
      options.desc = "Indent left";
    }
    {
      mode = "v";
      key = ">";
      action = ">gv";
      options.desc = "Indent right";
    }
  ];
}

