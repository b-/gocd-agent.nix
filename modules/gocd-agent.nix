{
  config,
  lib,
  modulesPath,
  pkgs,
  ...
}:
{
  disabledModules = [ "${modulesPath}/services/continuous-integration/gocd-agent/default.nix" ];
  imports = [ "${inputs.s}/nixos/modules/services/continuous-integration/gocd-agent/default.nix" ];
  config = {
    services.gocd-agent = {
      enable = true;
      goServer = "http://192.168.30.40:8153/go";
    };
  };
}

