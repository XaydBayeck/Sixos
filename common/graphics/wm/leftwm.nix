{ config, lib, pkgs, ... }:

{
  services.xserver = {
    layout = "us";

    libinput = {
      enable = true;
    };

    # displayManager.defaultSession = "none+leftwm";

    windowManager.leftwm = {
      enable = true;
    };
  };
}
