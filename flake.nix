{
  description = "Sid's NixOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    # nixos-cn.url = "github:nixos-cn/flakes";
    # nixos-cn.inputs.nixpkgs.follows = "nixpkgs";
    # nixos-cn.inputs.flake-utils.follows = "flake-utils";
    # manager user's home settings
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    # lightweight notification daemon
    wired.url = "github:Toqozz/wired-notify";
    # config neovim by nix
    nixvim.url = "github:pta2002/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    sinur.url = "github:XaydBayeck/Sinur";
    sinur.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, sinur, ... }@inputs:
    let system = "x86_64-linux"; in
    let pkgs = nixpkgs.legacyPackages.${system}; in
    let sinur-pkgs = sinur.packages.${system}; in
    let lib = nixpkgs.lib; in
    let subDirs = (path: with builtins; let d = readDir path; in filter (k: d.${k} == "directory") (attrNames d)); in
    let for'' = ks: f: with builtins; foldl' (a: b: a // b) { } (map f ks); in
    let prelude_mod = { lib, ... }: { options = { profileName = lib.mkOption { type = lib.types.str; }; }; }; in
    # let packages = for'' (subDirs ./packages) (x: { "${x}" = import (./packages + "/${x}") pkgs; }); in
    {
      overlays = [
        # (import ./overlays/packages.nix)
        (import ./overlays/teaks.nix)
      ];

      nixosConfigurations =

        for'' (subDirs ./profiles) (profileName:
          {
            "${profileName}" = lib.nixosSystem rec {
              inherit system;
              # specialArgs = extra-args // { inherit system; inherit packages; };
              specialArgs = inputs // { inherit system; };
              modules = [
                { nixpkgs.overlays = self.overlays; }
                prelude_mod
                { inherit profileName; }
                (./profiles + "/${profileName}/configuration.nix")
                home-manager.nixosModules.home-manager
                {
                  home-manager.useGlobalPkgs = true;
                  home-manager.useUserPackages = true;

                  home-manager.extraSpecialArgs = inputs // { inherit system; sinur-pkgs = sinur-pkgs; };
                }
              ];
            };
          });
    };
}
