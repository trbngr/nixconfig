# See /modules/darwin/* for actual settings
# This file is just *top-level* configuration.
{ flake, ... }:

let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  imports = [
    self.darwinModules.default
  ];

  #Determinate uses its own daemon to manage the Nix installation that
  #conflicts with nix-darwin’s native Nix management.
  #To turn off nix-darwin’s management of the Nix installation, set:
  nix.enable = true;

  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config.allowUnfree = true;
    overlays = [ inputs.nix-vscode-extensions.overlays.default ];
  };

  networking = {
    hostName = "macbookpro";
    computerName = "macbookpro";
  };
  system.primaryUser = "chris";

  # Automatically move old dotfiles out of the way
  #
  # Note that home-manager is not very smart, if this backup file already exists it
  # will complain "Existing file .. would be clobbered by backing up". To mitigate this,
  # we try to use as unique a backup file extension as possible.
  home-manager.backupFileExtension = "nixos-unified-template-backup";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;
}
