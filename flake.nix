{
  description = "Sid's NixOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    # nixos-cn.url = "github:nixos-cn/flakes";
    # nixos-cn.inputs.nixpkgs.follows = "nixpkgs";
    # nixos-cn.inputs.flake-utils.follows = "flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }@extra-args:
    let system = "x86_64-linux"; in
    let pkgs = nixpkgs.legacyPackages.${system}; in
    let lib = nixpkgs.lib; in
    let subDirs = (path: with builtins; let d = readDir path; in filter (k: d.${k} == "directory") (attrNames d)); in
    let for'' = ks: f: with builtins; foldl' (a: b: a // b) { } (map f ks); in
    let prelude_mod = { lib, ... }: { options = { profileName = lib.mkOption { type = lib.types.str; }; }; }; in
    # let packages = for'' (subDirs ./packages) (x: { "${x}" = import (./packages + "/${x}") pkgs; }); in
    {
      overlays = [
        (import ./overlays/packages.nix)
      ];

      nixosConfigurations =

        for'' (subDirs ./profiles) (profileName:
          {
            "${profileName}" = lib.nixosSystem rec {
              inherit system;
              # specialArgs = extra-args // { inherit system; inherit packages; };
              specialArgs = extra-args // { inherit system; };
              modules = [
                { nixpkgs.overlays = self.overlays; }
                prelude_mod
                { inherit profileName; }
                (./profiles + "/${profileName}/configuration.nix")
              ];
            };
          });
    };
}
