{ config, lib, pkgs, nixpkgs, libX11, libXinerama, ... }:

let
  rpathLibs = [ libX11 libXinerama ];
in
{

  nixpkgs.overlayers = [
    (self: super: {
      leftwm = pkgs.leftwm.overrideAttrs (finalAttrs: previousAttrs: {
        postInstall = ''
          for p in $out/bin/left*; do
            patchelf --set-rpath "${lib.makeLibraryPath rpathLibs}" $p
          done
        '';
      });
    })
  ];

  /* services.xserver.windowManager.session = singleton {
    name = "leftwm";
    start = ''
    ${pkgs.leftwm}/bin/leftwm &
    waitPID=$!
    '';
    }; */

  services.xserver = {
    # displayManager.defaultSession = "none+leftwm";

    windowManager.leftwm = {
      enable = true;
    };
  };
}
