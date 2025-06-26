{
  config,
  pkgs,
  ...
}:
let
  colimaHome = "${config.xdg.configHome}/colima";
in
{
  home.packages = with pkgs; [
    colima
    docker
    kubectl
  ];

  home.sessionVariables = {
    COLIMA_HOME = colimaHome;
    XDG_CONFIG_HOME = config.xdg.configHome;
  };

  launchd.agents.colima = {
    enable = false;
    config = {
      ProgramArguments = [
        "${pkgs.colima}/bin/colima"
        "start"
        "-f"
      ];
      Label = "com.colima.default";
      RunAtLoad = true;
      KeepAlive = {
        SuccessfulExit = true;
      };

      StandardOutPath = "${colimaHome}/launchd.stdout.log";
      StandardErrorPath = "${colimaHome}/launchd.stderr.log";

      EnvironmentVariables = {
        PATH = "${pkgs.colima}/bin:${pkgs.docker}/bin:/usr/bin:/bin:/usr/sbin:/sbin";
        COLIMA_HOME = colimaHome;
        XDG_CONFIG_HOME = config.xdg.configHome;
      };
      WorkingDirectory = config.home.homeDirectory;
    };
  };
}
