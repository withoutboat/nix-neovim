# nix-neovim

Personal Neovim configuration built on [NixVim](https://github.com/nix-community/nixvim).

## Features

- **Options**: Sensible defaults (2-space indent, relative line numbers, smartcase search, system clipboard integration, persistent undo).
- **Plugins**:
  - [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Syntax highlighting, indentation, and code folding.
  - [telescope](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder for files, live grep, buffers, and help tags.
  - [which-key](https://github.com/folke/which-key.nvim) - Popup helper for keybindings.
  - [lualine](https://github.com/nvim-lualine/lualine.nvim) - Fast and clean statusline.
  - [gitsigns](https://github.com/lewis6991/gitsigns.nvim) - Git diff indicators in the gutter.
  - [nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Automatic bracket and quote pairing.
  - [catppuccin](https://github.com/catppuccin/nvim) - Mocha colorscheme.
  - [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) - File icons.

## Keymaps

- `<leader>` is set to `<Space>`
- **Telescope**:
  - `<leader>ff` — Find files
  - `<leader>fg` — Live grep
  - `<leader>fb` — Open buffers
  - `<leader>fh` — Help tags
  - `<leader>fr` — Recent files
- **Navigation**:
  - `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` — Navigate between window splits
  - `<S-h>` / `<S-l>` — Previous / Next buffer
  - `<Esc>` — Clear search highlights
- **File Management**:
  - `<leader>w` — Save current buffer
  - `<leader>q` — Quit current buffer
- **Visual Mode**:
  - `J` / `K` — Move selected line(s) down / up
  - `<` / `>` — Indent left / right (keeps selection)

## Usage

### 1. Integration into `withoutboat/nix-home` (Home Manager)

Add `nix-neovim` to your `flake.nix` inputs:

```nix
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-neovim = {
      url = "github:withoutboat/nix-neovim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nix-neovim, ... }: {
    homeModules.default = { pkgs, ... }: {
      imports = [
        nix-neovim.homeManagerModules.default
      ];
    };
  };
}
```

This enables `programs.nixvim` with default editor set to Neovim.

#### Customizing in Home Manager

You can easily extend or override settings directly in your home-manager configuration:

```nix
{
  programs.nixvim = {
    # Override an option
    opts.relativenumber = false;

    # Add extra plugins
    plugins.oil.enable = true;
  };
}
```

### 2. Standalone run or build

Run directly without installing:

```bash
nix run github:withoutboat/nix-neovim
```

Or build the package:

```bash
nix build github:withoutboat/nix-neovim
./result/bin/nvim
```

### 3. NixOS Module

To install system-wide in NixOS:

```nix
{
  imports = [
    nix-neovim.nixosModules.default
  ];
}
```

## Repository Structure

```
.
├── flake.nix              # Flake definition & module exports
├── modules/
│   ├── default.nix        # Main NixVim configuration module
│   ├── options.nix        # Basic Neovim options & globals
│   ├── keymaps.nix        # Useful keymaps
│   └── plugins/
│       ├── default.nix    # Plugins aggregator
│       ├── treesitter.nix # Treesitter configuration
│       ├── telescope.nix  # Telescope fuzzy finder
│       ├── which-key.nix  # Which-key popup
│       └── ui.nix         # Catppuccin, lualine, gitsigns, autopairs
└── README.md
```
