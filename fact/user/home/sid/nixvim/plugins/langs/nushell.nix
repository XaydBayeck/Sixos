{ pkgs, ... }:

{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [ nvim-nu ];
    plugins.null-ls = {
      enable = true;
      extraOptions = {
        sources = { __raw = ''
            {
              require("null_ls").builtins.completion.luasnip,
              require("null_ls").builtins.completion.spell,
              require("null_ls").builtins.diagnostics.fish,
            }
          ''; };
      };
    };
  };
}
