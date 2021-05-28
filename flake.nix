{
  description = "Script ran by Github Actions to update Haddock documentation of telomare";

  inputs.haskellNix.url = "github:input-output-hk/haskell.nix";
  inputs.flake-compat = {
    url = "github:edolstra/flake-compat";
    flake = false;
  };
  inputs.nixpkgs.follows = "haskellNix/nixpkgs-unstable";

  outputs = { self, nixpkgs, flake-compat, haskellNix }: {
    defaultPackage.x86_64-linux =
      with import nixpkgs { system = "x86_64-linux"; };
      writeScriptBin "updateHaddockScript" ''
        cd telomare
        nix develop
        cabal haddock --haddock-hyperlink-source
        rsync -a dist-newstyle/build/x86_64-linux/ghc-8.8.4/telomare-0.1.0.0/doc/html/telomare/ ../stand-in-language.github.io/docs/haddock/
      '';
  };
}
