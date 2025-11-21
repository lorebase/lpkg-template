{
  description = "Development environment with rust and node";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        # Import modular configuration
        packages = import ./.nix/packages.nix { inherit pkgs; };

        # Evnironment variables
        denoCacheDir = ".cache/deno";
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = packages;

          # Set RUST_SRC_PATH for rust-analyzer
          shellHook = ''
            export RUST_SRC_PATH="${pkgs.rustPlatform.rustLibSrc}"
            export DENO_DIR="$PWD/${denoCacheDir}"
          '';
        };
      }
    );
}
