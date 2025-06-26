{ pkgs, ... }:
let
  extraNodePackages = import ./composition.nix {
    inherit pkgs;
    system = builtins.currentSystem;
    nodejs = pkgs.nodejs_24;
  };
in
{
  home.packages = [
    pkgs.nodejs_24
  ];
}
