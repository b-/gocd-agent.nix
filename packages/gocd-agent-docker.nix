{ inputs, ... }:
inputs.nixos-generators.nixosGenerate {
  system = "x86_64-linux";
  format = "docker";
  modules = [ ../modules/gocd-agent.nix ];

}
