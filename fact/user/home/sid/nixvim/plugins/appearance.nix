{ pkgs, lib, ... }:

{
  programs.nixvim.plugins = {
    barbar.enable = true;
    startify = {
      enable = true;
      enableSpecial = true;
    };
    lualine = {
      enable = true;
      theme = "nord";
      globalstatus = true;
      # extensions = [];
    };
  };
  # barbar = {
  #   enable = true;
  # };
}
