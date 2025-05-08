{ user, ... }:
{
  services.openssh = {
    enable = true;
    settings = {
      X11Forwarding = true;

      PermitRootLogin = "prohibit-password";
      PasswordAuthentication = true;
    };
    openFirewall = true;
  };
  environment.enableAllTerminfo = true;
}
