{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nushell # My favorite shell powerd by rust!
    # fishPlugins
    fishPlugins.bass   # Run bash scripts
    fishPlugins.puffer # Text Expansions
    fishPlugins.pisces # pisces ☯ 双鱼
  ];

  # programs.starship.zsh = true;

  environment.shells = with pkgs; [ fish nushell ];

  # Greate multi shell prompts powerd by Rust!
  programs.starship.enable = true;
}
