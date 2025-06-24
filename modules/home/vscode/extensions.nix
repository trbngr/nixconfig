{ pkgs, ... }:
{
  programs.vscode.profiles.default.extensions = with pkgs.vscode-marketplace; [
    fimars.github-plus-theme-elixir-adapted
    foxundermoon.shell-format
    github.copilot
    github.copilot-chat
    jnoortheen.nix-ide
    k--kato.intellij-idea-keybindings
    redhat.vscode-xml
    redhat.vscode-yaml
    jakebecker.elixir-ls
    tamasfe.even-better-toml
    jjk.jjk
  ];
}
