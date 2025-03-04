# configuration.nix
# The main configuration for the NixOS system

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./locale.nix
      ./packages.nix
      ./display.nix
      ./network.nix
      ./multimedia.nix
      ./system.nix
      ./services.nix
    ];
  nix.settings.experimental-features = [ "nix-command" ];
}
