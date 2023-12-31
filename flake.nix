{
  description = "AOC Elixir Devshell";
  inputs = {
    nixpkgs = {url = "github:NixOS/nixpkgs/nixos-23.11";};
    flake-utils = {url = "github:numtide/flake-utils";};
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};
      inherit (pkgs.beam.packages.erlang) elixir;
    in
      with pkgs; {
        devShell = pkgs.mkShell {
          buildInputs = [
            elixir
            elixir_ls
          ];
        };
      });
}
