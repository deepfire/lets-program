let
  compiler = "ghc865";
  overlays = [
    (self: super:
    {
      haskell = super.haskell // {
        packages = super.haskell.packages // {
          "${compiler}" =
            super.haskell.packages."${compiler}".override (oldArgs: {
              overrides = sel: sup:
                { gloss-game = super.haskell.lib.overrideCabal sup.gloss-game (old:
                    { src = super.fetchFromGitHub {
                        owner = "deepshared";
                        repo = "gloss-game";
                        rev = "2e5d10c7d66da7518ba3f37b166857fa31b7a5b2";
                        sha256 = "1f95kc8mngd2441dkvkv00si5q6xfym4myjgx4r569b2zbcygahl";
                      };
                    });
                };
            });
        };
      };
    })
  ];
  nixpkgs = import <nixpkgs> { inherit overlays; };
  ghc      = nixpkgs.pkgs.haskell.packages."${compiler}";
in with ghc;
  shellFor {
    packages    = p: [(ghc.callPackage (import ./default.nix) {})];
    withHoogle  = true;
    buildInputs = [ BigPixel cabal-install ];
  }
