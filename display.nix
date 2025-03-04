# display.nix
# this is the configuration for the display server settings for the NixOS system

{ config, pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ]; # For AMD graphics
  hardware.firmware = [ pkgs.linux-firmware ]; # Correctly specifying firmware package

  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.lightdm.background = /home/anakin/Wallpapers/Untitled_Artwork.jpeg;
  services.xserver.windowManager.qtile.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.libinput.enable = true;
}
