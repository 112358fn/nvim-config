let
  pkgs = import (fetchTarball "https://api.github.com/repos/NixOS/nixpkgs/tarball/25.05") { };
in
pkgs.mkShellNoCC {
  packages = with pkgs; [
    lua-language-server
    stylua
  ];
}
