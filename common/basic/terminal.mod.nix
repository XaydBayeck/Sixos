{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alacritty # fast GPU accelerate terminal
    tldr   # better manual Reader
    httpie # simple http client
    rar    # archive rar file
    unar   # extract from rar file, free software replacement of unrar
    zip    # archive zip file
    unzip  # extract from zip file
    p7zip  # support of 7z format, see 7-zip.org
    ripgrep# more faster
    fd     # file search
    bottom # morden top
    tree   # files tree view
    ranger # useful tui file manager
    hyfetch # system info report
    parted
  ];
}
