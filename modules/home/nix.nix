{ config, pkgs, lib, ... }:
{
  # To use the `nix` from `inputs.nixpkgs` on templates using the standalone `home-manager` template

  # `nix.package` is already set if on `NixOS` or `nix-darwin`.
  # TODO: Avoid setting `nix.package` in two places. Does https://github.com/juspay/nixos-unified-template/issues/93 help here?
  nix.package = lib.mkDefault pkgs.nix;
  home.packages = with pkgs; [
    config.nix.package
    nil
    nixfmt-rfc-style
    nixd # Nix language server
    nix-info # Nix info tool
    nixpkgs-fmt # Nix formatter
  ];
}
