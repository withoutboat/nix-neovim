# nix-neovim

A lightweight, reproducible Neovim configuration built on [NixVim](https://github.com/nix-community/nixvim).

This repository focuses purely on editor mechanics, language servers (LSP), formatting, search, and core keybindings. UI theming, statuslines, and tablines are omitted by design so they can be managed globally in system or home configurations.

---

## Keybindings

Leader key is mapped to `<Space>`.

### 1. General & Editing

| Key | Mode | Description |
| --- | --- | --- |
| `jk` or `kj` | Insert | Exit insert mode to normal mode |
| `<Esc>` | Normal | Clear search highlight (`:nohlsearch`) |
| `<leader>w` | Normal | Save buffer (`:w`) |
| `<leader>q` | Normal | Quit window (`:q`) |
| `x` | Normal | Delete character without overwriting default register (`"_x`) |
| `dw` | Normal | Delete word backward without overwriting register |
| `p` | Visual | Paste without replacing register contents |
| `<C-a>` | Normal | Select all text (`gg<S-v>G`) |
| `+` / `-` | Normal | Increment / decrement number |
| `J` / `K` | Visual | Move selected lines down / up |
| `<` / `>` | Visual | Indent left / right (retains selection) |
| `<leader>x` | Normal | Make current file executable (`chmod +x %`) |
| `<C-f>` | Normal | Open `tmux-sessionizer` |

### 2. Windows, Splits & Buffers

| Key | Mode | Description |
| --- | --- | --- |
| `ss` | Normal | Split window horizontally |
| `sv` | Normal | Split window vertically |
| `<Space>` | Normal | Cycle focus to next window (`<C-w>w`) |
| `sh` / `sj` / `sk` / `sl` | Normal | Move to left / lower / upper / right window |
| `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` | Normal | Move to left / lower / upper / right window |
| `<C-w><left/right/up/down>` | Normal | Resize window split |
| `te` | Normal | New tab (`:tabedit`) |
| `tn` | Normal | Next tab (`:tabNext`) |
| `[b` / `]b` | Normal | Previous / next buffer |

### 3. LSP (Language Server Protocol)

| Key | Mode | Description |
| --- | --- | --- |
| `gd` | Normal | Go to definition |
| `gD` | Normal | Go to declaration |
| `gi` | Normal | Go to implementation |
| `gr` | Normal | Find references |
| `K` | Normal | Hover documentation |
| `<leader>rn` / `<F2>` | Normal | Rename symbol |
| `<leader>ca` | Normal | Code actions |
| `gl` | Normal | Open line diagnostics floating window |
| `[d` / `]d` | Normal | Jump to previous / next diagnostic |
| `<leader>q` | Normal | Add diagnostics to location list |

Pre-configured servers:
- **TypeScript / JavaScript**: `ts_ls`, `eslint`
- **Go**: `gopls`
- **Rust**: `rust_analyzer`
- **Tailwind CSS**: `tailwindcss`
- **Prisma**: `prismals`
- **Lua**: `lua_ls`
- **Terraform**: `terraformls`

### 4. Code Formatting (`conform.nvim`)

Formatting is powered by `conform.nvim` with automatic fallback to LSP.

- **Format on save**: Enabled by default with 1000ms timeout.
- Supported formatters: `prettierd`/`prettier` (JS/TS/JSON/HTML/CSS), `stylua` (Lua), `nixfmt` (Nix), `rustfmt` (Rust), `gofmt`/`goimports` (Go), `trim_whitespace`.
- Manual trigger: `<leader>cf` — Format current buffer.

### 5. Search & Files (`telescope.nvim`)

| Key | Mode | Description |
| --- | --- | --- |
| `;f` | Normal | Find files |
| `;r` | Normal | Live grep |
| `\\\\` | Normal | Search open buffers |
| `;t` | Normal | Search help tags |
| `;;` | Normal | Resume last Telescope session |
| `;e` | Normal | List diagnostics |
| `sf` | Normal | Open file browser in current buffer directory |

### 6. GitHub Copilot & CopilotChat

GitHub Copilot is configured with inline ghost text suggestions, `nvim-cmp` dropdown integration, and interactive `CopilotChat`.

#### Inline Suggestions (Ghost Text)

| Key | Mode | Description |
| --- | --- | --- |
| `<Tab>` | Insert | Accept suggestion (falls back to normal Tab if none visible) |
| `<M-l>` | Insert | Accept suggestion |
| `<M-w>` | Insert | Accept next word of suggestion |
| `<M-j>` | Insert | Accept next line of suggestion |
| `<M-]>` | Insert | Cycle to next suggestion |
| `<M-[>` | Insert | Cycle to previous suggestion |
| `<C-]>` | Insert | Dismiss current suggestion |

#### CopilotChat

| Key | Mode | Description |
| --- | --- | --- |
| `<leader>cc` | Normal / Visual | Toggle CopilotChat window |
| `<leader>ce` | Normal / Visual | Explain selected code |
| `<leader>cr` | Normal / Visual | Review selected code |
| `<leader>cx` | Normal / Visual | Fix bug in selected code |
| `<leader>ct` | Normal / Visual | Generate tests for selected code |
| `<leader>cd` | Normal / Visual | Generate documentation for selected code |
| `<leader>cm` | Normal | Generate commit message for changes |
| `<leader>cq` | Normal | Reset chat history |
| `<leader>cp` | Normal / Visual | Open CopilotChat prompt picker |

#### Authentication

GitHub Copilot automatically detects credentials placed at `~/.config/github-copilot/hosts.json` (e.g. provisioned declaratively via `sops-nix`):

```json
{
  "github.com": {
    "user": "your-username",
    "oauth_token": "ghu_xxxxxxxxxxxxxxxxxxxx"
  }
}
```

Alternatively, authenticate interactively by running `:Copilot auth`.

### 7. Tools, Terminal & Git

| Key | Mode | Description |
| --- | --- | --- |
| `<C-\>` | Normal / Term | Toggle floating terminal (`toggleterm`) |
| `;tt` | Normal | Toggle `trouble.nvim` diagnostics panel |
| `;tw` | Normal | Toggle buffer diagnostics list |
| `gR` | Normal | Toggle LSP references in Trouble |
| `<leader>gb` | Normal | Git blame line (`gitsigns`) |
| `<leader>gd` | Normal | Git diff view (`gitsigns`) |

---

## Installation & Integration

### With Home Manager (`withoutboat/nix-home`)

Add this repository to your `flake.nix`:

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

This enables `programs.nixvim` and marks Neovim as the default editor (`EDITOR=nvim`).

### Extending in Downstream Configurations

You can add your global UI themes, extra plugins, or override options directly in your Home Manager configuration:

```nix
{
  programs.nixvim = {
    # Add your global colorscheme here
    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "mocha";
    };

    # Or customize options
    opts.relativenumber = false;
  };
}
```

### Standalone Usage

Run Neovim directly without installing:

```bash
nix run github:withoutboat/nix-neovim
```

Or build the standalone derivation:

```bash
nix build github:withoutboat/nix-neovim
./result/bin/nvim
```

---

## Module Layout

```
.
├── flake.nix              # Flake definition & module exports
├── modules/
│   ├── default.nix        # Base configuration aggregator
│   ├── options.nix        # Core editor options & autocommands
│   ├── keymaps.nix        # Primary keybindings
│   └── plugins/
│       ├── default.nix    # Plugins aggregator
│       ├── cmp.nix        # nvim-cmp completion engine
│       ├── conform.nix    # conform.nvim formatter
│       ├── copilot.nix    # GitHub Copilot (suggestions & CopilotChat)
│       ├── git.nix        # gitsigns & git-conflict
│       ├── lsp.nix        # Language servers & LSP keymaps
│       ├── telescope.nix  # telescope & file-browser
│       ├── tools.nix      # toggleterm & trouble
│       ├── treesitter.nix # treesitter, autopairs & autotag
│       └── which-key.nix  # which-key
└── README.md
```
