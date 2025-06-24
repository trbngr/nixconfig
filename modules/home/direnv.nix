{ ... }:
{
  programs.direnv = {
    enable = true;
    silent = true; # Don't print direnv messages on shell startup
    nix-direnv = {
      enable = true;
    };
    config.global = {
      prefix = [ "~/code" ];
    };
  };
}
