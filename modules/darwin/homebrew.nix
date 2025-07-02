{ flake, ... }:
let
  inherit (flake.inputs)
    nix-homebrew
    homebrew-core
    homebrew-cask
    homebrew-bundle
    ;
in
{
  imports = [
    nix-homebrew.darwinModules.nix-homebrew
  ];

  nix-homebrew = {
    enable = true;
    # TODO: figure out how to use 'config.me.username' here
    user = "chris";
    taps = {
      "homebrew/homebrew-core" = homebrew-core;
      "homebrew/homebrew-cask" = homebrew-cask;
      "homebrew/homebrew-bundle" = homebrew-bundle;
    };
    # With mutableTaps disabled, taps can no longer be added imperatively with `brew tap`.
    mutableTaps = false;
    autoMigrate = true;
  };

  homebrew = {
    enable = true;

    global = {
      brewfile = true;
      autoUpdate = false;
    };

    # https://github.com/nix-darwin/nix-darwin/blob/44a7d0e687a87b73facfe94fba78d323a6686a90/modules/homebrew.nix#L62
    onActivation = {
      autoUpdate = true; # Fetch the newest stable branch of Homebrew's git repo
      upgrade = true; # Upgrade outdated casks, formulae, and App Store apps
      # 'uninstall': uninstalls all formulae(and related files) not listed in the generated Brewfile
      cleanup = "uninstall";
    };

    masApps = {
      LogicPro = 634148309;
      polynome = 488165644;
      sonofield = 6740409139;
      msword = 462054704;
      dropover = 1355679052;
      coteditor = 1024640650;
    };

    casks = [
      # Communication Tools
      "discord"
      "slack"
      "zoom"

      # Utility Tools
      "pearcleaner"
      "shottr"
      "1password"
      "1password-cli"

      # Audio tools
      "soundsource"
      "loopback"

      # Productivity Tools
      "itsycal"
      "raycast"
      "stats"

      # Browsers
      # "librewolf"
      # "zen"
      "orion"

      # Media
      "iina"
      "spotify"

      # Games
      "steam"
    ];
  };
}
