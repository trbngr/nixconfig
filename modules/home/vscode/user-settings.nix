{ config, ... }:
let
  # TODO: Somehow use the hostName from the system config
  hostName = config.networking.hostName or "macbookpro";
in
{
  programs.vscode.profiles.default.userSettings = {
    # https://code.visualstudio.com/docs/getstarted/settings#_settingsjson

    editor.formatOnSave = true;
    workbench.colorTheme = "GitHub Plus Elixir Adapted";
    explorer.confirmDragAndDrop = false;

    git = {
      autofetch = true;
      confirmSync = false;
    };

    "[jsonc]".editor.defaultFormatter = "vscode.json-language-features";
    "[nix]".editor.defaultFormatter = "jnoortheen.nix-ide";
    "[yaml]".editor.defaultFormatter = "redhat.vscode-yaml";

    nix = {
      enableLanguageServer = true;
      serverPath = "nixd";
      serverSettings.nixd.options = {
        home-manager.expr = "(builtins.getFlake (builtins.toString ./.)).darwinConfigurations.${hostName}.options.home-manager.users.type.getSubOptions []";
      };
    };
  };
}
