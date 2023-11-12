{
  description = "Nix Templates";

  outputs = { self }: {
    templates = {
      empty = {
        path = ./empty;
        description = "Empty Template";
      };
      rust = {
        path = ./rust;
        description = "Rust Template";
      };
    };
  };
}
