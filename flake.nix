{
  description = "Script ran by Github Actions to update Haddock documentation of telomare";

  inputs.flake-compat = {
    url = "github:edolstra/flake-compat";
    flake = false;
  };
  inputs.nixpkgs.follows = "haskellNix/nixpkgs-unstable";

  outputs = { self, nixpkgs, flake-compat }: {
    defaultPackage.x86_64-linux =
      with import nixpkgs { system = "x86_64-linux"; };
      writeScriptBin "updateHaddockScript" ''
        echo Hello1
        echo hello2
      '';
  };
}
