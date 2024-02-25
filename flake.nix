{
  description = "";
  inputs = {
    nixpkgs.url = "flake:nixpkgs/nixpkgs-unstable";
    nixos-generators.url = "flake:nixos-generators";
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
