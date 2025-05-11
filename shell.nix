{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    zellij # multiplexer
    micro # editor

    elvish
  ];

  shellHook = ''
    elvish workspace.elv
  '';
}
