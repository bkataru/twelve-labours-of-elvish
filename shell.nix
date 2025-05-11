{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    zellij # multiplexer
    micro # editor
    carapace # shell completionss

    elvish
  ];

  shellHook = ''
    elvish workspace.elv
  '';
}
