{ ... }:
{
  plugins.which-key = {
    enable = true;
    settings = {
      spec = [
        {
          __unkeyed-1 = "<leader>c";
          group = "Copilot & Code";
        }
        {
          __unkeyed-1 = "<leader>e";
          desc = "Toggle Neo-tree";
        }
        {
          __unkeyed-1 = "<leader>o";
          desc = "Focus Neo-tree";
        }
      ];
    };
  };
}
