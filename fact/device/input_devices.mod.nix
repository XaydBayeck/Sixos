{ config, pkgs, ... }:

{
  services.xserver.libinput = {
    enable = true;
  };

  # If still not working ...
  # environment.systemPackages = with pkgs; [ libwacom ];
}
