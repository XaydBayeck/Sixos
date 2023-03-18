{ pkgs, lib, ... }:

{
  programs.nixvim.plugins = {
    startify = {
      enable = true;
      enableSpacial = true;
    };
    lualine = {
      enable = true;
      theme = "nord";
      globalstatus = true;
      # extensions = [];
    };
  };
  barbar = {
    enable = true;
  };
}
