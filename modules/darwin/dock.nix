{ pkgs, ... }:
{
  system = {
    defaults = {
      dock = {
        autohide = false;
        tilesize = 48;
        persistent-apps = [
          { app = "/System/Applications/Mail.app"; }
          { app = "/Applications/Orion.app"; }
          { app = "/Applications/Logic Pro.app"; }
          { app = "/Applications/Guitar Pro 8.app"; }
          {
            spacer = {
              small = true;
            };
          }
          { app = "/Applications/Spotify.app"; }
          { app = "${pkgs.alacritty}/Applications/Alacritty.app"; }
          # { app = "${pkgs.wezterm}/Applications/WezTerm.app"; }
          { app = "${pkgs.obsidian}/Applications/Obsidian.app"; }
          { app = "/System/Applications/System Settings.app"; }
          {
            spacer = {
              small = true;
            };
          }
          { app = "/Applications/Steam.app"; }
          { app = "/Applications/Discord.app"; }
          { app = "/Applications/Slack.app"; }
          { app = "/Applications/zoom.us.app"; }
        ];
      };
    };
  };
}
