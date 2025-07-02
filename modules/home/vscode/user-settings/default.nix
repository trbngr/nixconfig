{ ... }:
{
  imports = [
    ./nix-ide.nix
  ];

  programs.vscode.profiles.default.userSettings = {
    # https://code.visualstudio.com/docs/getstarted/settings#_settingsjson

    "editor.formatOnSave" = true;
    "workbench.colorTheme" = "GitHub Plus Elixir Adapted";
    "explorer.confirmDragAndDrop" = false;
    "scm.defaultViewMode" = "tree";

    "git.autofetch" = false;
    "git.confirmSync" = false;

    "[jsonc]"."editor.defaultFormatter" = "vscode.json-language-features";
    "[json]"."editor.defaultFormatter" = "vscode.json-language-features";
    "[nix]"."editor.defaultFormatter" = "jnoortheen.nix-ide";
    "[yaml]"."editor.defaultFormatter" = "redhat.vscode-yaml";
    "[typescriptreact]"."editor.defaultFormatter" = "vscode.typescript-language-features";
    "[css]"."editor.defaultFormatter" = "vscode.css-language-features";
  };
}
