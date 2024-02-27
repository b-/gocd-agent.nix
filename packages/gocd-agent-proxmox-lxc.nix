{ inputs, ... }@flakeContext:
let
  gocd-agent = import ../modules/gocd-agent.nix;
in
inputs.nixos-generators.nixosGenerate {
  system = "x86_64-linux";
  format = "proxmox-lxc";
  modules = [ gocd-agent ];
}