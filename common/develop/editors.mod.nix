{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    neovim
  ];

  # programs.neovim.defaultEditor = true;
  environment.variables.EDITOR = "nvim";
  # programs.neovim.vimAlias = true;
  # programs.neovim.viAlias = true;
  environment.shellAliases = {
    vi = "nvim";
    vim = "nvim";
  };
}
