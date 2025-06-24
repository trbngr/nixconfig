{ pkgs, ... }:
# This is your nix-darwin configuration.
# For home configuration, see /modules/home/*
{
  imports = [
    ./common
    ./dock.nix
    ./finder.nix
    ./fonts.nix
    ./homebrew.nix
    ./keyboard.nix
  ];

  environment.shells = [
    pkgs.zsh
    pkgs.bash
    pkgs.nushell
    pkgs.fish
  ];

  # Use TouchID for `sudo` authentication
  security.pam.services.sudo_local.touchIdAuth = true;

  # Configure macOS system
  # More macbookpros => https://github.com/ryan4yin/nix-darwin-kickstarter/blob/main/rich-demo/modules/system.nix
}
