{ stdenv, fetchFromGitHub }:

let
  src = (import ../nix/sources.nix {}).fish-bobthefish;
in stdenv.mkDerivation rec {
  name = "bobthefish";
  version = "2020-01-21";

  inherit src;

  installPhase = ''
    mkdir -p $out/lib
    cp -r . $out/lib/bobthefish
  '';
}
