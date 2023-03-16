{ config, pkgs, ... }:

{
  # Enable sound.
  # Volume Control: $ alsamixer
  # test: speaker-test -c 2
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  # hardware.pulseaudio.package = pkgs.pulseaudioFull;

  # hardware.pulseaudio.extraModules = with pkgs; [ pulseaudio-modules-bt ];

  # Whether to enable volume and capture control with keyboard media keys.
  # sound.mediaKeys.enable = true;

  environment.systemPackages = with pkgs; [
    pavucontrol # PulseAudio Volume Control
    paprefs     # PulseAudio Preferences
    pasystray   # PulseAudio system tray
    # ncpamixer   # An ncurses mixer for PulseAudio inspired by pavucontrol
    # Rofi-based interface to select source/sink (aka input/output) with PulseAudio
    # rofi-pulse-select 
  ];
}
