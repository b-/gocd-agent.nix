{ inputs, ... }:
inputs.nixos-generators.nixosGenerate {
  system = "x86_64-linux";
  format = "proxmox-lxc";
  modules = [ ../modules/gocd-agent.nix ];
}
