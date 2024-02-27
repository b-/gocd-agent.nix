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
          gocd-agent-proxmox-lxc = import ./packages/gocd-agent-proxmox-lxc.nix flakeContext;
          gocd-agent-proxmox = import ./packages/gocd-agent-proxmox.nix flakeContext;
          gocd-agent-docker = import ./packages/gocd-agent-docker.nix flakeContext;
        };
      };
      hydraJobs = {
        gocd-agent-proxmox-lxc = self.packages.x86_64-linux.gocd-agent-lxc;
        gocd-agent-proxmox = self.packages.x86_64-linux.gocd-agent-lxc;
        gocd-agent-docker = self.packages.x86_64-linux.gocd-agent-lxc;
      };
    };
}
