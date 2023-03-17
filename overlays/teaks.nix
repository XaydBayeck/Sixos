self: super:

with builtins;

let
  dirContents = readDir ./teaks;

  genPackage = name: {
    inherit name;
    value = import (./teaks + "/${name}") self super;
  };

  names = attrNames dirContents;
in
  listToAttrs (map genPackage names)
