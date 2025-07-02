{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (writeShellScriptBin "edit-config" ''
      code ~/nixconfig
    '')
  ];
}
