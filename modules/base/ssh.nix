{ user, ... }: {
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


  users.users."${user.username}".openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDY89h3jRlpdXRpuwQmz0Va8xPhgnMn1ZQGbIxIzmz6YlTV7OGQTcyWw2kvVCObB7N1ucU/37QDEgzaE/kOUnMiHJTo/QyifLFqV0DIlVX3EtNOLIdirWEk+jvynFTfI8TR2xqK0j+b4cZV2V5HbttYivDAH1kqYPy4nvqIlMAXaMoudfwht80UA8rjjVMsLgZZAAd6YgR5A+xhecDSWzwbBiwyRIGG7xV6n69Mp2JP6+Up7DO4qQx608MBGVQZQvu/z/xk4yIiuuONa+lUVqCw3wMVgROLcfcs4HAUiLZDR5JD2KfEUvsogbmUgmNHEaUbz3JO4E9D4uQ+q2aC/k2DIxjXCQqEcBWuWQ1kY3lizsaXdOuQNxtTEL7uWcCiM+VmlXV8+LBAgxaULTSchJZQzr3CXog7D6ocGOyI5fkXTG2FXesF4PhvZIwLwYaf5oR41XYO7F9h48j5ObTVVkcWTJxpur4MDJc6BQ69nE/TC0cIVHESkSIwWO0R2MLTKlU= thijsvanwaaij"
  ];
}
