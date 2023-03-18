{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      lsp.servers.nil_ls = {
        enable = true;
        settings = {
          formatting = {
            command = [ "nixpkgs-fmt" ];
          };
        };
      };
      nix.enable = true;
    };
    extraPackages = with pkgs; [ nixpkgs-fmt ];
  };
}
