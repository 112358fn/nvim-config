let
  pkgs = import (fetchTarball "https://api.github.com/repos/NixOS/nixpkgs/tarball/25.05") { };
in
pkgs.mkShellNoCC {
  packages = with pkgs; [
    nixfmt-rfc-style
    lua-language-server
    stylua
  ];
}
