{ pkgs, ... }:

{
  # Nix packages to install to $HOME
  #
  # Search for packages here: https://search.nixos.org/packages
  #   or use `nix search nixpkgs <term>` in the terminal.
  home.packages = with pkgs; [
    alacritty
    omnix
    devenv
    difftastic
    libreoffice-bin

    # Unix tools
    fd
    gnumake
    just
    less
    (ripgrep.override { withPCRE2 = true; })
    sd
    tree
  ];

  # Programs natively supported by home-manager.
  # They can be configured in `programs.*` instead of using home.packages.
  programs = {
    jq.enable = true;
    # Install btop https://github.com/aristocratos/btop
    btop.enable = true;

    # Tmate terminal sharing.
    tmate = {
      enable = true;
      #host = ""; #In case you wish to use a server other than tmate.io
    };
  };
}
