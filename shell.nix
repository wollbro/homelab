{
  pkgs ? import <nixpkgs> { config.allowUnfree=true; }
}:
pkgs.mkShell {
  nativeBuildInputs = with pkgs.buildPackages; [
    terraform
    packer
    nodejs
    ansible
    cargo
    sshpass
  ];
}
