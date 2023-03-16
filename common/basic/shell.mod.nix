{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nushell # My favorite shell powerd by rust!
  ];

  programs.starship.enable = true;
  # programs.starship.zsh = true;

  environment.shells = with pkgs; [ fish nushell ];

  # Greate multi shell prompts powerd by Rust!
  programs.starship.enable = true;
}
