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

      # YAML
      yamlls = {
        enable = true;
        settings = {
          schemaStore = {
            enable = true;
            url = "https://www.schemastore.org/api/json/catalog.json";
          };
          schemas = {
            # Cerbos policy definitions & test suites
            "https://api.cerbos.dev/latest/cerbos/policy/v1/Policy.schema.json" = [
              "/cerbos/*"
              "cerbos/*"
              "*cerbos*/**/*.yaml"
              "*cerbos*/**/*.yml"
              "*.cerbos.yaml"
              "*.cerbos.yml"
            ];
            "https://api.cerbos.dev/latest/cerbos/policy/v1/TestSuite.schema.json" = [
              "/cerbos/**/*_test.yaml"
              "/cerbos/**/*_test.yml"
              "*cerbos*/**/*_test.yaml"
              "*cerbos*/**/*_test.yml"
            ];
            "https://api.cerbos.dev/latest/cerbos/policy/v1/TestFixture/Resources.schema.json" = [
              "/cerbos/**/testdata/resources.yaml"
              "/cerbos/**/testdata/resources.yml"
              "*cerbos*/**/testdata/resources.yaml"
              "*cerbos*/**/testdata/resources.yml"
            ];
            "https://api.cerbos.dev/latest/cerbos/policy/v1/TestFixture/Principals.schema.json" = [
              "/cerbos/**/testdata/principals.yaml"
              "/cerbos/**/testdata/principals.yml"
              "*cerbos*/**/testdata/principals.yaml"
              "*cerbos*/**/testdata/principals.yml"
            ];
            "https://api.cerbos.dev/latest/cerbos/policy/v1/TestFixture/AuxData.schema.json" = [
              "/cerbos/**/testdata/auxdata.yaml"
              "/cerbos/**/testdata/auxdata.yml"
              "*cerbos*/**/testdata/auxdata.yaml"
              "*cerbos*/**/testdata/auxdata.yml"
            ];
          };
          validate = true;
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
        "<leader>dj" = "goto_next";
        "<leader>dk" = "goto_prev";
        "<leader>dn" = "goto_next";
        "<leader>dp" = "goto_prev";
        "gl" = "open_float";
        "<leader>dl" = "open_float";
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
