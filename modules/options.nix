{ ... }:
{
  # Global options
  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };

  # Neovim options
  opts = {
    # Line numbers
    number = true;
    relativenumber = true;

    # Indentation
    tabstop = 2;
    shiftwidth = 2;
    softtabstop = 2;
    expandtab = true;
    smartindent = true;

    # Search
    ignorecase = true;
    smartcase = true;
    hlsearch = true;
    incsearch = true;

    # UI & Appearance
    termguicolors = true;
    cursorline = true;
    signcolumn = "yes";
    scrolloff = 8;
    sidescrolloff = 8;
    wrap = false;

    # Behavior
    mouse = "a";
    clipboard = "unnamedplus";
    undofile = true;
    swapfile = false;
    backup = false;
    updatetime = 250;
    timeoutlen = 300;

    # Splits
    splitright = true;
    splitbelow = true;
  };
}
