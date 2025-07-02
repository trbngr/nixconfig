{ ... }:
{
  imports = [
    ./extensions.nix
    ./user-settings
    ./user-tasks.nix
    ./keybindings.nix
    ./snippets.nix
  ];

  programs = {
    vscode = {
      enable = true;
    };
  };

}
