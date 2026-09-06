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

    # Window navigation
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

    # Buffer navigation
    {
      mode = "n";
      key = "<S-h>";
      action = "<cmd>bprevious<CR>";
      options.desc = "Switch to previous buffer";
    }
    {
      mode = "n";
      key = "<S-l>";
      action = "<cmd>bnext<CR>";
      options.desc = "Switch to next buffer";
    }

    # Quick save & quit
    {
      mode = "n";
      key = "<leader>w";
      action = "<cmd>w<CR>";
      options.desc = "Save file";
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
