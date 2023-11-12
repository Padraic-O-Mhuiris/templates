{ inputs, ... }:

{
  config.perSystem = { system, ... }: {
    _module.args.pkgs = import inputs.nixpkgs {
      inherit system;
      overlays = [ inputs.rust.overlays.default ];
    };
  };
}
