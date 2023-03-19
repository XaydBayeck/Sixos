{ inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./basic.nix
    # ./nixvim
  ];
}
