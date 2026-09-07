{ ... }:
{
  # Global options
  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };

  # Neovim options
  opts = {
    # Encoding
    encoding = "utf-8";
    fileencoding = "utf-8";

    # Line numbers
    number = true;
    relativenumber = true;

    # Indentation
    autoindent = true;
    smartindent = true;
    tabstop = 2;
    shiftwidth = 2;
    softtabstop = 2;
    expandtab = true;
    breakindent = true;

    # Search
    ignorecase = true;
    smartcase = true;
    hlsearch = true;
    incsearch = true;
    inccommand = "split";

    # Appearance & Layout
    termguicolors = true;
    cursorline = true;
    signcolumn = "yes";
    scrolloff = 10;
    sidescrolloff = 8;
    wrap = false;

    # Folding
    foldlevel = 99;
    foldlevelstart = 99;
    foldenable = true;

    # Behavior
    mouse = "a";
    clipboard = "unnamedplus";
    undofile = true;
    swapfile = false;
    backup = false;
    showcmd = true;
    updatetime = 250;
    timeoutlen = 300;

    # Splits
    splitright = true;
    splitbelow = true;
  };

  # Autocommands
  autoCmd = [
    # Turn off paste mode when leaving insert
    {
      event = [ "InsertLeave" ];
      pattern = [ "*" ];
      command = "set nopaste";
    }
  ];
}

