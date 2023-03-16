{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    xclip # clipboard
    zathura # doc browzer
    crow-translate # dict, ocr, translater
    flameshot # screen cut
  ];
}
