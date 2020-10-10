{ mkDerivation, base, gloss, gloss-game, gloss-juicy, stdenv }:
mkDerivation {
  pname = "LetsProgram";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base gloss gloss-game gloss-juicy ];
  license = "unknown";
  hydraPlatforms = stdenv.lib.platforms.none;
}
