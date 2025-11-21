{ pkgs }:

let
  # Rust toolchain (hermetic, no rustup)
  rustTools = import ./rust.nix { inherit pkgs; };
in

with pkgs; [

  deno


  # Useful tools
  git
  gh  # GitHub CLI
  curl
  wget
] ++ rustTools
