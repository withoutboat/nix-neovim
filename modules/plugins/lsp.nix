{ ... }:
{
  plugins.lsp = {
    enable = true;

    servers = {
      # TypeScript / JavaScript
      ts_ls.enable = true;

      # ESLint
      eslint.enable = true;

      # Go
      gopls = {
        enable = true;
        settings = {
          gopls = {
            analyses = {
              unusedparams = true;
            };
            staticcheck = true;
          };
        };
      };

      # Rust
      rust_analyzer = {
        enable = true;
        installCargo = false;
        installRustc = false;
      };

      # Tailwind CSS
      tailwindcss.enable = true;

      # Prisma
      prismals.enable = true;

      # Lua
      lua_ls = {
        enable = true;
        settings = {
          Lua = {
            diagnostics = {
              globals = [ "vim" ];
            };
            workspace = {
              checkThirdParty = false;
            };
          };
        };
      };

      # Terraform
      terraformls.enable = true;

      # Nix
      nixd = {
        enable = true;
        settings = {
          formatting = {
            command = [ "nixfmt" ];
          };
          nixpkgs = {
            expr = "import <nixpkgs> { }";
          };
        };
      };
    };

    keymaps = {
      lspBuf = {
        "gd" = "definition";
        "gD" = "declaration";
        "gi" = "implementation";
        "gr" = "references";
        "K" = "hover";
        "<leader>rn" = "rename";
        "<F2>" = "rename";
        "<leader>ca" = "code_action";
      };

      diagnostic = {
        "[d" = "goto_prev";
        "]d" = "goto_next";
        "gl" = "open_float";
        "<leader>q" = "setloclist";
      };
    };
  };

  # Standard diagnostic display settings
  diagnostic = {
    settings = {
      virtual_text = true;
      update_in_insert = true;
      float = {
        source = "always";
        border = "rounded";
      };
    };
  };
}
