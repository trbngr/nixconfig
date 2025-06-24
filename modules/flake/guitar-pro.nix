{ ... }:

{
  perSystem =
    { pkgs, ... }:
    let
      guitar-pro = pkgs.stdenv.mkDerivation {
        pname = "guitar-pro";
        version = "8.0.0";

        src = pkgs.fetchurl {
          url = "https://downloads.guitar-pro.com/gp8/stable/guitar-pro-8-setup.pkg";
          # Replace with the actual hash. Run once with a dummy hash to get the expected one.
          hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
        };

        dontUnpack = true;

        installPhase = ''
          mkdir -p $out
          cp $src $out/guitar-pro-8.pkg
        '';
      };
    in
    {
      packages.guitar-pro = guitar-pro;
    };
}
