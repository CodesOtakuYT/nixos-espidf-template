let
  nixpkgs-esp-dev = fetchGit {
    url = "https://github.com/mirrexagon/nixpkgs-esp-dev.git";
    rev = "5287d6e1ca9e15ebd5113c41b9590c468e1e001b";
  };

  pkgs = import <nixpkgs> {
    overlays = [(import "${nixpkgs-esp-dev}/overlay.nix")];

    # The Python library ecdsa is marked as insecure, but we need it for esptool.
    # See https://github.com/mirrexagon/nixpkgs-esp-dev/issues/109
    config.permittedInsecurePackages = [
      "python3.13-ecdsa-0.19.1"
    ];
  };
in
  pkgs.mkShell {
    name = "esp-project";

    buildInputs = with pkgs; [
      esp-idf-full
    ];
  }
