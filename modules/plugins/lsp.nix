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

  # Diagnostic display settings
  diagnostic = {
    settings = {
      virtual_text = {
        prefix = "● ";
      };
      update_in_insert = true;
      float = {
        source = "always";
        border = "rounded";
      };
    };
  };

  # Custom diagnostic icons in the gutter
  extraConfigLua = ''
    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
  '';
}
