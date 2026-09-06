{ ... }:
{
  plugins = {
    # Syntax highlighting and parsing
    treesitter = {
      enable = true;
      highlight.enable = true;
      indent.enable = true;
      folding.enable = true;
    };

    # Auto close and rename HTML/JSX tags
    ts-autotag.enable = true;

    # Auto pair brackets, quotes, etc.
    nvim-autopairs = {
      enable = true;
      settings = {
        disable_filetype = [
          "TelescopePrompt"
          "vim"
        ];
      };
    };
  };
}

