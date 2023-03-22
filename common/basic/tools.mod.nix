{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    xclip # clipboard
    zathura # doc browzer
    crow-translate # dict, ocr, translater
    flameshot # screen cut
    screenkey # display the key you press
    xorg.xmodmap   # setting and query your modifier keys
    pcmanfm # powerful file manager
    gparted 
    usbutils
  ];

  programs.dconf.enable = true;

  # clipboard manager aim to use with rofi
  services.greenclip.enable = true;
}
