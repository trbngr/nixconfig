{ flake, ... }:
let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  imports = [
    self.homeModules.default
  ];

  # Defined by /modules/home/me.nix
  # And used all around in /modules/home/*
  me = {
    username = "chris";
    fullname = "Chris Martin";
    email = "chris@deepstaging.com";
  };

  home.stateVersion = "24.11";
}
