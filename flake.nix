{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages.hello = pkgs.hello;

        devShell = pkgs.mkShell { buildInputs = [ 
            pkgs.dune_3
            pkgs.ocamlPackages.menhir
            pkgs.ocamlPackages.odoc
            pkgs.ocaml
          ]; };
      });
}
