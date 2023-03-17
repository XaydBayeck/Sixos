{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nushell # My favorite shell powerd by rust!
    # fishPlugins
    bass   # Run bash scripts
    puffer # Text Expansions
    pisces # pisces ☯ 双鱼
  ];

  # programs.starship.zsh = true;

  environment.shells = with pkgs; [ fish nushell ];

  # Greate multi shell prompts powerd by Rust!
  programs.starship.enable = true;
}
