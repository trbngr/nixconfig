{ pkgs, ... }:
{
  programs.vscode.profiles.default.extensions = with pkgs.vscode-marketplace; [
    fimars.github-plus-theme-elixir-adapted
    foxundermoon.shell-format
    github.copilot
    github.copilot-chat
    jakebecker.elixir-ls
    jjk.jjk
    jnoortheen.nix-ide
    k--kato.intellij-idea-keybindings
    nefrob.vscode-just-syntax
    redhat.vscode-xml
    redhat.vscode-yaml
    tamasfe.even-better-toml
  ];
}
