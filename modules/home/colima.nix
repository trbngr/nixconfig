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
  ];

  home.sessionVariables = {
    COLIMA_HOME = colimaHome;
  };

  launchd.agents.colima = {
    enable = true;
    config = {
      ProgramArguments = [
        "${pkgs.colima}/bin/colima"
        "start"
        "--foreground"
      ];
      Label = "com.colima.default";
      RunAtLoad = true;
      KeepAlive = true;

      StandardOutPath = "${colimaHome}/default/launchd.stdout.log";
      StandardErrorPath = "${colimaHome}/default/launchd.stderr.log";

      EnvironmentVariables = {
        COLIMA_HOME = colimaHome;
        PATH = "${pkgs.colima}/bin:${pkgs.docker}/bin:/usr/bin:/bin:/usr/sbin:/sbin";
      };
    };
  };
}
