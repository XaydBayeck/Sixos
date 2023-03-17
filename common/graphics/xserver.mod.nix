{ config, pkgs, wired, ... }:

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
    picom-jonaburg   # window compositor
    trayer  # lightweight systray for UNIX desktop
    # i3lock-color # simple screen locker
    wired.packages.${config.nixpkgs.localSystem.system}.wired
  ];
}
