{ ... }:
let
  authSocket = "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock";
in
{
  home.sessionVariables = {
    SSH_AUTH_SOCK = authSocket;
  };

  launchd.agents._1password-ssh-agent = {
    enable = true;
    config = {
      ProgramArguments = [
        "/bin/sh"
        "-c"
        "/bin/ln -sf \"${authSocket}\" \$SSH_AUTH_SOCK"
      ];
      Label = "com.1password.SSH_AUTH_SOCK";
      RunAtLoad = true;
    };
  };

  programs.ssh = {
    enable = true;

    extraOptionOverrides = {
      IdentityAgent = "\"${authSocket}\"";
    };
  };
}
