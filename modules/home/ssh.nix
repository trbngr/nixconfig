{ ... }:
{
  programs.ssh = {
    enable = true;

    # Set the top-level options that are available
    forwardAgent = false;
    serverAliveInterval = 60;
    controlMaster = "auto";
    controlPath = "~/.ssh/sockets/%r@%h-%p";
    controlPersist = "10m";

    # Inject the options that are missing from the top level
    extraConfig = ''
      IdentitiesOnly yes
    '';
  };
}
