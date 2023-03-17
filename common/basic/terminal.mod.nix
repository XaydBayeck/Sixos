{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alacritty # fast GPU accelerate terminal
    tldr   # better manual Reader
    httpie # simple http client
    unar   # extract from rar file, free software replacement of unrar
    unzip  # extract from zip file
    p7zip  # support of 7z format, see 7-zip.org
    ripgrep# more faster
    fd     # file search
    bottom # morden top
    tree   # files tree view
    ranger # useful tui file manager
    neofetch # system info report
    parted
  ];
}
