{
  description = "<PROJECT_DESCRIPTION>";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    rust.url = "github:oxalica/rust-overlay";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      debug = true;
      systems = import inputs.systems;
      imports = [
        inputs.treefmt-nix.flakeModule
        ./nix/devshell.nix
        ./nix/formatter.nix
        ./nix/overlays.nix
        ./nix/packages.nix
      ];
    };
}
