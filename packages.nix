# packages.nix
# this is for adding and removing packages from the NixOS system

{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
      bash
      brightnessctl
      cryptsetup
      firmwareLinuxNonfree
      qtile
      pavucontrol
      pulseaudioFull
      python3
      python3Packages.qtile-extras
      python3Packages.pip
      python3Packages.pillow
      python3Packages.psutil
      udev
      unzip
      vim
      wget
      wg-netmanager
      wireguard-tools
      xorg.libxcb
      xorg.libXext
      xorg.libX11
  ];

  users.users.anakin = {
    isNormalUser = true;
    description = "anakin";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      arandr
      brave
      discord
      dosfstools
      drm_info 
      dunst
      emacs
      eza
      exfatprogs
      fastfetch
      file
      fzf
      flameshot
      gimp
      git
      ghostscript
      graphicsmagick
      htop
      jellyfin-ffmpeg
      kitty
      kmonad
      #localsend
      mpv
      nerdfonts
      nitrogen
      neovim
      picom
      #protonvpn-gui
      #protonmail-desktop
      python3Packages.qtile-extras
      python3Packages.pywal
      tldr
      qtile
      qutebrowser
      ripgrep
      rofi
      rpi-imager
      spotify
      spotifyd
      spotify-player
      udiskie
      ueberzug
      usbutils
      vieb
      viu
      vlc
      yazi
      #zellij
    ];
  };

  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;
}
