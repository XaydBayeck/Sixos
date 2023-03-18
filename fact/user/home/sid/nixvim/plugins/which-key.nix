{ pkgs, ... }:

{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      which-key-nvim
      hop-nvim
      # nvim-ts-rainbow
    ];
    extraConfigLua = builtins.readFile ./which-key.lua ;
  };
}
