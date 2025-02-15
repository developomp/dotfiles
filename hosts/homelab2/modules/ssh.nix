{ ... }:

{
  # hack (can't log into root@homelab2 but homelab2@homelab2 works)
  security.sudo.wheelNeedsPassword = false;

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PubkeyAuthentication = true;
      PermitRootLogin = "yes";

      AllowUsers = null;
      UseDns = true;
      X11Forwarding = false;
    };
  };

  services.fail2ban = {
    enable = true;
    ignoreIP = [
      # fron tailscale
      "homelab"
      "desktop"
      "laptop"
    ];
    maxretry = 5; # Ban IP after 5 failures
    bantime = "24h"; # Ban IPs for one day on the first ban
    bantime-increment = {
      enable = true; # Enable increment of bantime after each violation
      multipliers = "1 2 4 8 16 32 64";
      maxtime = "168h"; # Do not ban for more than 1 week
      overalljails = true; # Calculate the bantime based on all the violations
    };
  };
}
