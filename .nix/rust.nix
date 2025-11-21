{ pkgs }:

# Use rust from nixpkgs with all components
# This is fully hermetic - no rustup, no $HOME dependencies
with pkgs; [
  # Rust toolchain from nixpkgs (stable)
  rustc
  cargo
  rustfmt
  clippy
  rust-analyzer
  rustPlatform.rustLibSrc

  # Additional rust tools
  cargo-edit      # cargo add, cargo rm, cargo upgrade
  cargo-watch     # cargo watch for auto-recompilation
]
