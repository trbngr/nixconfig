{ ... }:
{
  imports = [
    ./extensions.nix
    ./user-settings.nix
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
