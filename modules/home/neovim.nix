{ lib, flake, ... }:
let
  inherit (flake.inputs) neve-nixvim;
in
{
  imports = [
    flake.inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    imports = [ neve-nixvim.nixvimModule ];
    colorschemes.catppuccin.enable = lib.mkForce false;
    colorschemes.nord.enable = true;
    harpoon.enable = false;
    nvim-jdtls.enable = false;
  };
}
