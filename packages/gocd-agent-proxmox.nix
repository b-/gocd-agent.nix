{ inputs, ... }@flakeContext:
let
  nixosModule = import ../modules/gocd-agent.nix {inherit inputs;};
in
inputs.nixos-generators.nixosGenerate {
  system = "x86_64-linux";
  format = "proxmox";
  modules = [ nixosModule ];
}
