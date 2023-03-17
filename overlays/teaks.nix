self: super:

with builtins;

let
  dirContents = readDir ./packages;

  genPackage = name: {
    inherit name;
    value = import (./teaks + "/${name}") self super;
  };

  names = attrNames dirContents;
in
  listToAttrs (map genPackage names)
