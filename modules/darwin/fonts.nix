{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      emacs-all-the-icons-fonts
      font-awesome
      fontconfig
      material-design-icons
      nerd-fonts.fira-code
      nerd-fonts.iosevka
      nerd-fonts.jetbrains-mono
      nerd-fonts.symbols-only
      nerd-fonts.meslo-lg
    ];
  };
}
