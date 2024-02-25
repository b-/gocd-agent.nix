{
  description = "";
  inputs = {
    nixpkgs.url = "flake:nixpkgs/nixpkgs-unstable";
    nixos-generators.url = "flake:nixos-generators";
    s.url = "github:sgonzalezoyuela/nixpkgs/a9eba62d9e62cee71e69104a600023719e44eacc";
  };
  outputs = inputs:
    let
      flakeContext = {
        inherit inputs;
      };
    in
    {
      packages = {
        x86_64-linux = {
          gocd-agent-lxc = import ./packages/gocd-agent-lxc.nix flakeContext;
        };
      };
    };
}
