{ pkgs, ... }:

{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [ nvim-nu ];
    plugins.null-ls = {
      enable = true;
      extraOptions = {
        sources = { __raw = ''
            {
              require("null-ls").builtins.completion.luasnip,
              require("null-ls").builtins.completion.spell,
              require("null-ls").builtins.diagnostics.fish,
            }
          ''; };
      };
    };
  };
}
