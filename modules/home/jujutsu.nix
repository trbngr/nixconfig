{ config, ... }:
{
  programs.jujutsu = {
    enable = true;
    ediff = false;
    settings = {
      user = {
        name = config.me.fullname;
        email = config.me.email;
      };
      ui = {
        editor = "nvim";
        pager = "less -R";
        paginate = "never";
      };
    };
  };
}
