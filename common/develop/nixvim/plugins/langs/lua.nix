{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
    lsp.servers.lua-ls = {
      enable = true;
      settings = {
        telemetry.enable = true;
      };
    };
  };
  extraPlugins = with pkgs.vimPlugins; [ neodev-nvim ];
};
}
