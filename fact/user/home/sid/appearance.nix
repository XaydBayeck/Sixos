{ config, lib, pkgs, ... }:

{
  gtk = with pkgs; {
    enable = true;
    cursorTheme = {
      package = nordzy-cursor-theme;
      name = "Nordzy-cursors";
    };
    theme = {
      package =  plata-theme;
      name = "Plata-Red-Noir-Compact";
    };
    iconTheme = {
      package = tela-icon-theme;
      name = "Tela Red Dark";
    };
  };

  services.polybar = {
    enable = true;
  };
}
