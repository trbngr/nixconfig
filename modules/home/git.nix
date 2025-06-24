{ config, ... }:
{
  home.shellAliases = {
    g = "git";
    lg = "lazygit";
  };

  programs = {
    lazygit.enable = true;
    git = {
      enable = true;
      userName = config.me.fullname;
      userEmail = config.me.email;

      ignores = [
        "*~"
        "*.swp"
      ];

      aliases = {
        ci = "commit";
        st = "status";
      };

      extraConfig = {
        init.defaultBranch = "main";
        core = {
          editor = "vim";
          autocrlf = "input";
        };
        pull.rebase = true;
        rebase.autoStash = true;
      };

      difftastic = {
        enable = true;
        enableAsDifftool = true;

        background = "light";
        # background = "dark";

        display = "side-by-side";
        # display = "side-by-side-show-both";
        # display = "inline";
      };
    };
  };

}
