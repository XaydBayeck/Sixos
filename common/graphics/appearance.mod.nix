{ config, pkgs, ... }:

{
  # make qt applications look similar to GTK ones
  qt5.enable = true;
  qt5.platformTheme = "gtk2";
  qt5.style = "gtk2";

  environment.systemPackages = with pkgs; [
    # papirus-icon-theme
    # BeautyLine
    vimix-icon-theme
    vimix-gtk-themes
    nordzy-cursor-theme
  ];
}
