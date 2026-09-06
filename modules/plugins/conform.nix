{ ... }:
{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      format_on_save = {
        lsp_format = "fallback";
        timeout_ms = 1000;
      };
      formatters_by_ft = {
        javascript = [
          "prettierd"
          "prettier"
        ];
        typescript = [
          "prettierd"
          "prettier"
        ];
        javascriptreact = [
          "prettierd"
          "prettier"
        ];
        typescriptreact = [
          "prettierd"
          "prettier"
        ];
        json = [
          "prettierd"
          "prettier"
        ];
        html = [
          "prettierd"
          "prettier"
        ];
        css = [
          "prettierd"
          "prettier"
        ];
        lua = [ "stylua" ];
        nix = [ "nixfmt" ];
        rust = [ "rustfmt" ];
        go = [
          "gofmt"
          "goimports"
        ];
        "*" = [ "trim_whitespace" ];
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>cf";
      action = "<cmd>lua require('conform').format({ async = true, lsp_format = 'fallback' })<CR>";
      options.desc = "Format buffer";
    }
  ];
}
