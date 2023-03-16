{ config, lib, pkgs, ... }:

{
  services = {
    upower.enable = true;

    xserver = {
      enable = true;
      layout = "us";

      libinput = {
        enable = true;
      };

      displayManager.defaultSession = "none+xmonad";

      windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
      };

      xkbOptions = "caps:ctrl_modifier";
    };
  };

  systemd.services.upower.enable = true;

}

