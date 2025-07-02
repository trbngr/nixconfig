{ config, ... }:
let
  # TODO: Somehow use the hostName from the system config
  hostName = config.networking.hostName or "macbookpro";
  languageServer = "nixd"; # or "nil"
in
{
  programs.vscode.profiles.default.userSettings = {
    "nix.serverPath" = languageServer;
    "nix.formatterPath" = "nixfmt";
    "nix.enableLanguageServer" = true;

    "nix.serverSettings" = {
      nixd.options = {
        darwin.expr = "(builtins.getFlake (builtins.toString ./.)).darwinConfigurations.${hostName}.options";
        home-manager.expr = "(builtins.getFlake (builtins.toString ./.)).darwinConfigurations.${hostName}.options.home-manager.users.type.getSubOptions []";
      };

      nil = {
        formatting = {
          command = [ "nixfmt" ];
        };

        diagnostics = {
          # Ignored diagnostic kinds.
          # The kind identifier is a snake_cased_string usually shown together
          # with the diagnostic message.
          # Type: [string]
          # Example: ["unused_binding", "unused_with"]
          ignored = [ ];

          # Files to exclude from showing diagnostics. Useful for generated files.
          # It accepts an array of paths. Relative paths are joint to the workspace root.
          # Glob patterns are currently not supported.
          # Type: [string]
          # Example: ["Cargo.nix"]
          excludedFiles = [ ];
        };

        nix = {
          # The path to the `nix` binary.
          # Type: string
          # Example: "/run/current-system/sw/bin/nix"
          binary = "nix";

          # The heap memory limit in MiB for `nix` evaluation.
          # Currently it only applies to flake evaluation when `autoEvalInputs` is
          # enabled, and only works for Linux. Other `nix` invocations may be also
          # applied in the future. `null` means no limit.
          # As a reference, `nix flake show --legacy nixpkgs` usually requires
          # about 2GiB memory.
          # Type: number | null
          # Example: 1024
          maxMemoryMB = 2560;

          flake = {
            # Auto-archiving behavior which may use network.
            #
            # - null: Ask every time.
            # - true: Automatically run `nix flake archive` when necessary.
            # - false: Do not archive. Only load inputs that are already on disk.
            # Type: null | boolean
            # Example: true
            autoArchive = null;

            # Whether to auto-eval flake inputs.
            # The evaluation result is used to improve completion, but may cost
            # lots of time and/or memory.
            #
            # Type: boolean
            # Example: true
            autoEvalInputs = false;

            # The input name of nixpkgs for NixOS options evaluation.
            #
            # The options hierarchy is used to improve completion, but may cost
            # lots of time and/or memory.
            # If this value is `null` or is not found in the workspace flake's
            # inputs, NixOS options are not evaluated.
            #
            # Type: null | string
            # Example: "nixos"
            nixpkgsInputName = "nixpkgs";
          };
        };
      };
    };
  };
}
