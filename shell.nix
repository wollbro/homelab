{
  pkgs ? import <nixpkgs> { config.allowUnfree=true; }
}:
pkgs.mkShell {
  nativeBuildInputs = with pkgs.buildPackages; [terraform ansible packer];
}
