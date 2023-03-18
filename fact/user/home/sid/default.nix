{ nixvim, ... }:

{
  imports = [
    nixvim.homeManagerModules.nixvim
    ./basic.nix
    ./nixvim
  ];
}
