{ ... }:

{
  imports = [
    ./tools.nix
    ./complete.nix
    ./appearance.nix
    ./treesitter.nix
    ./language_servers.nix
    ./langs
    ./which-key.nix
  ];
}
