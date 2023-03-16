{ config, pkgs, ... }:

{
  programs.firefox.enable = true;

  programs.firefox.languagePacks = [
    "zh-CN"
  ];

  environment.systemPackages = with pkgs; [
    wget2 # Down load files from network
    curl
    w3m # Web browser in terminal
    # Nyxt # Interesting keyboard base web browser
    # A lightweight, multi-protocol, multi-source, command-line download utility
    aria 
    clash # proxy
  ];
}
