{ pkgs, ... }:
{
  # The GUI does not launch under macos sequoia 15.5.
  # Switched to modules/darwin/homebrew.nix
  home.packages = with pkgs; [
    # _1password-cli
    # _1password-gui
  ];
}
