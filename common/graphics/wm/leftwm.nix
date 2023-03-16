{ config, lib, pkgs, ... }:

{
  services.xserver = {
    # displayManager.defaultSession = "none+leftwm";

    windowManager.leftwm = {
      enable = true;
    };
  };
}
