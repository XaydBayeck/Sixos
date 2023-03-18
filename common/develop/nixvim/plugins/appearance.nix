{ pkgs, lib, ... }:

{
  programs.nixvim.plugins = {
    barbar.enable = true;
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
  # barbar = {
  #   enable = true;
  # };
}
