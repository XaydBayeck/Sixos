{ config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sid = {
    isNormalUser = true;
    description = "sid";
    extraGroups = [ "networkmanager" "wheel" ];
    # packages = with pkgs; [ ];
    shell = pkgs.fish;
  };

  # Enable automatic login for the user.
  # services.getty.autologinUser = "sid";
  home-manager.users.sid = import ./home/sid;
}
