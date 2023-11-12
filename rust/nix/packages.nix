{ ... }:

{
  config.perSystem = { pkgs, ... }:
    let cargoToml = builtins.fromTOML (builtins.readFile ../Cargo.toml);
    in {
      packages.default = pkgs.rustPlatform.buildRustPackage {
        inherit (cargoToml.package) name version;
        src = ../.;
        cargoLock.lockFile = ../Cargo.lock;
      };

    };
}
