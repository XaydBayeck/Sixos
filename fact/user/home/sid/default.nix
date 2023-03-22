{ nixvim, ... }:

{
  imports = [
    nixvim.homeManagerModules.nixvim
    ./basic.nix
    ./nixvim
    ./appearance.nix
    ./graphics.nix
    ./shell.nix
    ./media.nix
    ./diveces.nix
  ];
}
