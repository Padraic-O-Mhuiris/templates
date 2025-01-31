{ ... }:

{
  config.perSystem = { pkgs, config, ... }: {
    devShells.default = pkgs.mkShell {
      inputsFrom = [ config.treefmt.build.devShell ];
      shellHook = ''
        export RUST_SRC_PATH=${pkgs.rustPlatform.rustLibSrc}
      '';
      buildInputs = with pkgs; [ libiconv ];
      nativeBuildInputs = with pkgs; [ rust-bin.stable.latest.complete ];
    };
  };
}
