{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system: with import nixpkgs { inherit system; }; {
        devShells.default = mkShell {
          buildInputs = [
            jetbrains.idea-community-src
            jdk23
          ];
        };

        formatter = nixfmt-tree;
      }
    );
}
