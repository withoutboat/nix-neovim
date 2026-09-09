{ ... }:
{
  plugins = {
    # Completion engine
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
        mapping = {
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<C-k>" = "cmp.mapping.select_prev_item()";
          "<C-b>" = "cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' })";
          "<C-f>" = "cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' })";
          "<C-Space>" = "cmp.mapping(cmp.mapping.complete(), { 'i', 'c' })";
          "<C-e>" = "cmp.mapping { i = cmp.mapping.abort(), c = cmp.mapping.close() }";
          "<CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
        };
        sources = [
          { name = "nvim_lsp"; }
          { name = "buffer"; }
          { name = "path"; }
          { name = "luasnip"; }
        ];
      };
    };

    # Snippet engine
    luasnip.enable = true;
  };

  opts = {
    completeopt = [
      "menuone"
      "noinsert"
      "noselect"
    ];
  };
}
