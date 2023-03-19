{ pkgs, ... }:

{
  programs = {
    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [ 
        batdiff 
        batman
        batpipe
        batgrep
        batwatch
        prettybat
      ];
    };
    # nushell = {
    #   enable = true;
    # };
    starship = {
      enable = true;
      enableFishIntegration = true;
    };
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
    broot = {
      enable = true;
      enableFishIntegration = true;
      settings.modal = true;
    };
    fzf = {
      enable = true;
      enableFishIntegration = true;

    };
    git = {
      enable = true;
      delta.enable = true;
      userEmail = "SydBayeck@outlook.com";
      userName = "Sid";
    };
  };
}
