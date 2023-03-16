{ config, pkgs, ... }:
 {
   services.xserver.videoDrivers = [ "nvidia" ];
    
   # Whether to use the open source kernel module
   # hardware.nvidia.open = true;
 }
