{ config, pkgs, ... }:

{
  programs.git.enable = true;
  programs.git.config = {
    user = {
      email = "SidBayeck@outlook.com";
      name = "Sid";
    };
  };

  environment.systemPackages = with pkgs; [
    gh # the Github CLI tool
  ];
}
