{ ... }:
{
programs.zellij = {
    enable = true;
    attachExistingSession = false;
    enableZshIntegration = false;
    enableBashIntegration = false;
    enableFishIntegration = false;
  };
}
