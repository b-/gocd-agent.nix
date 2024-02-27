{ inputs, ... }@flakeContext:
let
  nixosModule = { config, lib, pkgs, self, modulesPath, ... }: {
    config = {
      disabledModules = [ "${modulesPath}/services/continuous-integration/gocd-agent/default.nix" ];
      imports = [ "${inputs.s}/nixos/modules/services/continuous-integration/gocd-agent/default.nix" ];
      services = {
        gocd-agent = {
          enable = true;
          goServer = "http://192.168.30.40:8153/go";
        };
      };
    };
  };
in
inputs.nixos-generators.nixosGenerate {
  system = "x86_64-linux";
  format = "proxmox-lxc";
  modules = [
    nixosModule
  ];
}
