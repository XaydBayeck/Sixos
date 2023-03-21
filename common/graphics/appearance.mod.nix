{ config, pkgs, ... }:

{
  # make qt applications look similar to GTK ones
  qt.enable = true;
  qt.platformTheme = "gtk2";
  qt.style = "gtk2";

  environment.systemPackages = with pkgs; [
    # papirus-icon-theme
    # BeautyLine
    vimix-icon-theme
    vimix-gtk-themes
    nordzy-cursor-theme
  ];
}
