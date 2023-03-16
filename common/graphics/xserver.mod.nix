{ config, pkgs, ... }:

{
  imports = [
    ./wm/leftwm.nix
  ];
  # Config Graphics Enviroments
  services.xserver = {
    enable = true;
    # use more morden terminal emulaters
    # excludePackages = [ pkgs.xterm ];
    layout = "us";
  };

  environment.systemPackages = with pkgs; [
    rofi    # Gui applications menu
    polybar # fashing status bar
    feh     # most simple img viewer also as wallpaper setter
    dmenu   # bacup applications menu
    # picom # window compositor
  ];
}
