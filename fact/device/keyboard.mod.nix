{ config, pkgs, ... }:

{
  services.xserver = {
    # Configure keymap in X11
    layout = "us";
    xkbVariant = "";
  };
}
