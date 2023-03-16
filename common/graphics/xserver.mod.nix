{ config, pkgs, ... }:

{
  # Config Graphics Enviroments
  services.xserver = {
    enable = true;
    # use more morden terminal emulaters
    # excludePackages = [ pkgs.xterm ];
    layout = "us";
  };
}
