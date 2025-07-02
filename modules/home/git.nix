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

      aliases.ci = "commit";
      aliases.st = "status";

      extraConfig = {
        init.defaultBranch = "main";

        core = {
          editor = "vim";
          autocrlf = "input";
        };

        pull.rebase = true;
        rebase.autoStash = true;

        user = {
          signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE+/vH6bhVCBdjUnDP/rlcfcjJxpq7iLgugq2NlP59Bi";
        };

        gpg = {
          format = "ssh";
          ssh = {
            program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
          };
        };

        commit = {
          gpgsign = true;
        };

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
