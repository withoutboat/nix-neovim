# nix-neovim

Personal Neovim configuration built on [NixVim](https://github.com/nix-community/nixvim), ported and modernized from legacy Lua configuration.

## Features & Modules

- **Core & Options** (`modules/options.nix`):
  - 2-space indentation (`tabstop`, `shiftwidth`, `autoindent`, `smartindent`).
  - Relative line numbers, cursorline, 80-character colorcolumn.
  - Smart search (`ignorecase`, `smartcase`, `hlsearch`, `inccommand = "split"`).
  - System clipboard (`unnamedplus`), persistent undo (`undofile`), scrolloff = 10.
  - Automatic `nopaste` on `InsertLeave`.

- **Keymaps** (`modules/keymaps.nix`):
  - Insert mode exit: `jk` and `kj` → `<Esc>`.
  - Splits: `ss` (horizontal) and `sv` (vertical).
  - Window navigation: `<Space>` to cycle windows; `sh`, `sj`, `sk`, `sl` (and `<C-h/j/k/l>`) to navigate splits.
  - Window resizing: `<C-w><left/right/up/down>`.
  - Tabs: `te` (`:tabedit`), `tn` (`:tabNext`).
  - Buffer cycling: `<Tab>` / `<S-Tab>`.
  - Quick actions: `x` (blackhole delete), `dw` (delete word backward), `p` in visual mode (paste without replacing register), `<C-a>` (select all), `<leader>x` (`chmod +x`), `<C-f>` (`tmux-sessionizer`).

- **UI & Theme** (`modules/plugins/ui.nix`):
  - [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) - Night style with transparent background.
  - [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - TokyoNight statusline with powerline glyphs and diagnostics.
  - [bufferline.nvim](https://github.com/akinsho/nvim-bufferline.lua) - Tabline with slant separators.
  - [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) - File icons.

- **Fuzzy Finder & Navigation** (`modules/plugins/telescope.nix`):
  - [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) with custom prompts (` `, ` `).
  - [telescope-file-browser.nvim](https://github.com/nvim-telescope/telescope-file-browser.nvim) on `sf`.
  - Keymaps: `;f` (find files), `;r` (live grep), `\\\\` (buffers), `;t` (help tags), `;;` (resume), `;e` (diagnostics).

- **Syntax & Language Support** (`modules/plugins/treesitter.nix`):
  - [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Syntax highlighting, indentation, and folding.
  - [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) - Auto close and rename HTML/JSX tags.
  - [nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Auto close brackets and quotes.

- **LSP** (`modules/plugins/lsp.nix`):
  - Pre-configured language servers:
    - TypeScript / JavaScript (`ts_ls`)
    - ESLint (`eslint`)
    - Go (`gopls`)
    - Rust (`rust_analyzer`)
    - Tailwind CSS (`tailwindcss`)
    - Prisma (`prismals`)
    - Lua (`lua_ls`)
    - Terraform (`terraformls`)
  - Keymaps: `gd` (definition), `gD` (declaration), `gi` (implementation), `gr` (references), `K` (hover), `<leader>rn` / `<F2>` (rename), `<leader>ca` (code action), `gl` (float diagnostic), `[d` / `]d` (next/prev diagnostic).
  - Diagnostic symbols in gutter (` `, ` `, ` `, ` `).

- **Completion & AI** (`modules/plugins/cmp.nix`):
  - [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) with sources: Copilot, LSP, buffers, path, LuaSnip.
  - [copilot.lua](https://github.com/zbirenbaum/copilot.lua) + [copilot-cmp](https://github.com/zbirenbaum/copilot-cmp) integration.
  - [lspkind.nvim](https://github.com/onsails/lspkind.nvim) pictograms.
  - `<C-j>` / `<C-k>` for completion item selection.

- **Git** (`modules/plugins/git.nix`):
  - [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) for gutter change indicators and blame (`<leader>gb`, `<leader>gd`).
  - [git-conflict.nvim](https://github.com/akinsho/git-conflict.nvim) for merge conflict resolution.

- **Tools** (`modules/plugins/tools.nix`):
  - [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) - Floating terminal toggled via `<C-\>`.
  - [trouble.nvim](https://github.com/folke/trouble.nvim) - Diagnostic and reference explorer (`;tt`, `;tw`, `;tq`, `;tl`, `gR`).
  - [which-key.nvim](https://github.com/folke/which-key.nvim) - Keybinding helper.

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

You can easily override or add settings in downstream configurations:

```nix
{
  programs.nixvim = {
    opts.relativenumber = false;
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

## Repository Structure

```
.
├── flake.nix              # Flake definition & module exports
├── modules/
│   ├── default.nix        # Main NixVim configuration module
│   ├── options.nix        # Basic Neovim options, autocommands & globals
│   ├── keymaps.nix        # Custom keymaps (splits, buffers, navigation)
│   └── plugins/
│       ├── default.nix    # Plugins aggregator
│       ├── ui.nix         # Tokyonight, lualine, bufferline, devicons
│       ├── telescope.nix  # Telescope & telescope-file-browser
│       ├── treesitter.nix # Treesitter, ts-autotag, nvim-autopairs
│       ├── lsp.nix        # Language servers, LSP keymaps & diagnostics
│       ├── cmp.nix        # nvim-cmp, copilot, luasnip, lspkind
│       ├── git.nix        # gitsigns, git-conflict
│       ├── tools.nix      # toggleterm, trouble
│       └── which-key.nix  # which-key
└── README.md
```

