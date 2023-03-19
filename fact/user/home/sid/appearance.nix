{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    nordzy-cursor-theme
    plata-theme
    tela-icon-theme
  ];

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

  qt = {
    enable = true;
    platformTheme = "gtk";
  };

  home.pointCursor = {
    package = pkgs.nordzy-cursor-theme;
    gtk.enable = true;
    name = "Nordzy-cursors";
    x11.enable = true;
    x11.defaultCursor = "Nordzy-cursors";
  };
}
