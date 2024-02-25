{ inputs, ... }@flakeContext:
let
  nixosModule = { config, lib, pkgs, ... }: {
    config = {
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
