{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix.settings.substituters = [ 
    "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" 
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
