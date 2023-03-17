# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
       ../../common/graphics
      ../../common/nix
      ../../common/media
      ../../common/locales
      ../../common/basic
      ../../common/develop
      ../../common/web
      ../../fact/device
      ../../fact/user
      ../../fact/network
      ../../fact/hardware
    ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?
}
