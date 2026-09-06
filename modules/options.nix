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

    # UI & Appearance
    title = true;
    termguicolors = true;
    cursorline = true;
    colorcolumn = "80";
    signcolumn = "yes";
    showtabline = 2;
    cmdheight = 1;
    laststatus = 2;
    scrolloff = 10;
    sidescrolloff = 8;
    wrap = false;
    winblend = 0;
    pumblend = 5;
    wildoptions = "pum";
    background = "dark";

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

