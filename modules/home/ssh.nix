{ config, ... }:
{
  programs.ssh = {
    enable = true;
    includes = [ "/Users/${config.me.username}/.ssh/config_external" ];
    matchBlocks = {
      "github.com" = {
        identitiesOnly = true;
        identityFile = [ "/Users/${config.me.username}/.ssh/id_github" ];
      };
    };
  };
}
