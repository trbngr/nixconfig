# Like GNU `make`, but `just` rustier.
# https://just.systems/
# run `just` from this directory to see available commands

# Default command when 'just' is run without arguments
default:
  @just --list

# Update nix flake
[group('Main')]
update:
  nix flake update

# Lint nix files
[group('dev')]
lint:
  nix fmt

# Check nix flake
[group('dev')]
check:
  nix flake check

# Manually enter dev shell
[group('dev')]
dev:
  nix develop

# Activate the configuration
[group('Main')]
run:
  nix run

# generate node packages with node2nix
[group('dev')]
gen-node-packages:
  nix-env -f '<nixpkgs>' -iA nodePackages.node2nix
  node2nix -d \
    --input modules/home/node/packages.json \
    --composition modules/home/node/composition.nix \
    --output modules/home/node/packages.nix \
    --node-env modules/home/node/env.nix
