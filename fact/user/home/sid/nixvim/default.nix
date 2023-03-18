{ nixvim ,... }:
{
  imports = [
    ./basic.nix
    ./plugins
    ./keybindings.nix
  ];

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };
}
