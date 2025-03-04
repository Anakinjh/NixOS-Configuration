# network.nix
# this file is for configuring network and firewall settings

{ config, pkgs, lib, ... }:
{
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Example of additional networking settings:
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 22 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  services.openssh.enable = true;

  # Enable resolvconf for DNS management
  networking.resolvconf = {
    enable = true;
    package = lib.mkForce pkgs.openresolv;
  };
  # Setting up Rapsberry Pi router; comment out after set up is complete
  #networking.interfaces.etho.ipv4.addresses = [ {
  #  address = "192.168.1.10";
  #  prefixLength = 24;
  #} ];
  #networking.defaultGateway = "192.168.1.1";
  #networking.nameservers = [ "1.1.1.1" ];
}

