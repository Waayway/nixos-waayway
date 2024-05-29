{ user, hostname, ... }: {
  users.users."${user.username}" = {
    home = "/home/${user.username}";
    isNormalUser = true;
    group = "${user.username}";
  };
}
