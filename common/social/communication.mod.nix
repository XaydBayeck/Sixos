{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    tdesktop # telegrame desktop client
    element-desktop # Matrix.org client
    discord  # community!
  ];
}
