{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    zellij # multiplexer
    micro # editor

    elvish

    nebula
  ];

  shellHook = ''
    elvish workspace.elv
  '';
}