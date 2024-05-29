{ user, ... }: {
  users.groups = {
    "${user.username}" = { };
    docker = { };
    adbusers = { };
    plugdev = { };
    uinput = { };
  };

  users.users."${user.username}" = {
    extraGroups = [
      user.username
      "users"
      "networkmanager"
      "wheel"
      "audio"
      "video"
      "docker"
      "adbusers"
      "libvirtd"
    ];
  };
}
