{ config, pkgs, ... }:

{
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Whether to start the OpenSSH agent when you log in. 
  # The OpenSSH agent remembers private keys for you so that you don’t have to type in passphrases every time you make an SSH connection.
  programs.ssh.startAgent = true;
}
