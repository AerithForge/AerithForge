# Configuration file for Nix(OS) to provide a temporary development enviroment

{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "armbian-build";
  buildInputs = with pkgs; [
    bash # For evaluation
    nil # Language server for nix
    git # For manipulating with the repository and runtime
    shellcheck # For linting shell
    util-linux # Needed for uuidgen
  ];
}
