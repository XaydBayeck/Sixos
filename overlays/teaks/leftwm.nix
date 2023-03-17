self: super:

super.leftwm.overridAttrs (oldAttrs:
  let
    rpathLibs = oldAttrs.buildInputs;
  in
  {
    postInstall = ''
      for p in $out/bin/left*; do
        patchelf --set-rpath "${lib.makeLibraryPath rpathLibs}" $p
      done
    '';
  })

