{
  description = "";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixos-generators.url = "github:nix-community/nixos-generators";
    s.url = "github:sgonzalezoyuela/nixpkgs/a9eba62d9e62cee71e69104a600023719e44eacc";
  };
  outputs =
    { self, ... }@inputs:
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
      hydraJobs = {
        gocd-agent-lxc = self.packages.x86_64-linux.gocd-agent-lxc;
      };
    };
}
