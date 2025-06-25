{ ... }:
let
  extraNodePackages = import ./composition.nix { };
in
{
  home.packages = [
    # Node packages
    extraNodePackages."@google/gemini-cli"
  ];
}
