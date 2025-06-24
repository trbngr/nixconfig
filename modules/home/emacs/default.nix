{
  config,
  pkgs,
  lib,
  ...
}:
let
  emacsEnabled = false;
in
{
  config = lib.mkIf emacsEnabled {

    programs.emacs = {
      enable = emacsEnabled;
      package = pkgs.emacs30;
    };

    fonts.fontconfig.enable = true;

    home = {
      sessionVariables = {
        DOOMDIR = "${config.xdg.configHome}/doom.d";
        EMACSDIR = "${config.xdg.configHome}/emacs";
        DOOMLOCALDIR = "${config.xdg.dataHome}/doom";
        DOOMPROFILELOADFILE = "${config.xdg.stateHome}/doom-profiles-load.el";
      };
      sessionPath = [ "${config.xdg.configHome}/emacs/bin" ];
    };

    xdg = {
      configFile."doom.d".source = ./doom.d;
      configFile."emacs".source = builtins.fetchGit {
        url = "https://github.com/doomemacs/doomemacs.git";
        rev = "03d692f129633e3bf0bd100d91b3ebf3f77db6d1";
      };
    };
  };
}
