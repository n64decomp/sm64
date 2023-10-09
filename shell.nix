{ pkgs ? import <nixpkgs> {
    # https://nixos.org/manual/nixpkgs/stable/#sec-cross-usage
    localSystem = (import <nixpkgs/lib>).systems.examples.x86_64-darwin;
    crossSystem = (import <nixpkgs/lib>).systems.examples.mips-linux-gnu;
  }
}:

pkgs.callPackage
  ({ mkShell
   , gnumake42
   }: mkShell {
    # pulled from https://github.com/n64decomp/sm64#step-1-install-dependencies-1
    depsBuildBuild = [
      gnumake42 # v4.4 breaks the build!
    ];
    strictDeps = true;

    shellHook = ''
      NEW_PATH_DIR=$(mktemp -d)
      export PATH="$NEW_PATH_DIR:$PATH"

      MAKE_PATH=$(which make)
      ln -s $MAKE_PATH $NEW_PATH_DIR/gmake
    '';
  })
{ }
