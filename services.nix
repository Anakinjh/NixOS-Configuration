# Services.nix
{ config, pkgs, ... }:

{
  # Enabling battery management through tlp
  services.tlp.enable = true;
  
  services.tlp.settings = {
    START_CHARGE_THRESH_BAT0 = 50;
    STOP_CHARGE_THRESH_BAT0 = 85;
    RUNTIME_PM_ALL = "auto";
    #DISK_APM_LEVEL_ON_AC= "254";
    #DISK_APM_LEVEL_ON_BAT= "128";
    DEVICES_TO_DISABLE_ON_AC="bluetooth";
    DEVICES_TO_DISABLE_ON_BAT="bluetooth";
    CPU_SCALING_GOVERNOR_ON_AC = "performance";
    CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
    SOUND_POWER_SAVE_ON_BAT = 5;
    SOUND_POWER_SAVE_CONTROLLER = "Y";
    MEM_SLEEP_ON_AC= "s2idle";
    MEM_SLEEP_ON_BAT= "deep";
  };

  # Running the emacs background daemon
  systemd.services.emacs = {
    description = "Emacs: the extensible, self-documenting text editor";
    after = [ "network.target" ];  # Adjust dependencies as needed
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      Type = "forking";
      ExecStart = "${pkgs.emacs}/bin/emacs --daemon";
      ExecStop = "${pkgs.emacs}/bin/emacsclient --eval '(kill-emacs)'";
      Restart = "always";
      User = "anakin";  # Replace with your actual username
    };
  };
  
  # Systemd-resolved service
  services.resolved.enable = true;

}

