{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # my preferred dev tools
    # jetbrains.rider
    # jetbrains.datagrip

    # jetbrains.clion
    # jetbrains.goland
    # jetbrains.intellij
    # jetbrains.pycharm
    # jetbrains.rubymine
  ];
}
