{ lib, pkgs, ... }:
{
    systemd.services."adguardhome".serviceConfig = {
    DynamicUser = lib.mkForce false;
    User = "nixserver-service";
    Group = "nixserver-service";
  };

  # Enable the adguardhome service
  services.adguardhome.enable = true;
  
  # Allows AdGuard Home to open raw sockets (`CAP_NET_RAW`), which is
  # required for the integrated DHCP server.
  #
  # The default enables this conditionally if the declarative configuration
  # enables the integrated DHCP server. Manually setting this option is only
  # required for non-declarative setups.
  #
  # services.adguardhome.allowDHCP = config.services.adguardhome.settings.dhcp.enabled or false;
  
  # Extra command line parameters to be passed to the adguardhome binary.
  # services.adguardhome.extraArgs = [ ];
  
  # Allow changes made on the AdGuard Home web interface to persist between
  # service restarts.
  #
  services.adguardhome.mutableSettings = true;
  
  # Open ports in the firewall for the AdGuard Home web interface. Does not
  # open the port needed to access the DNS resolver.
  #
  services.adguardhome.openFirewall = true;
  
  # AdGuard Home configuration. Refer to
  # <https://github.com/AdguardTeam/AdGuardHome/wiki/Configuration#configuration-file>
  # for details on supported values.
  #
  # ::: {.note}
  # On start and if {option}`mutableSettings` is `true`,
  # these options are merged into the configuration file on start, taking
  # precedence over configuration changes made on the web interface.
  #
  # Set this to `null` (default) for a non-declarative configuration without any
  # Nix-supplied values.
  #
  # Declarative configurations are supplied with a default `schema_version`, `bind_host`, and `bind_port`.
  #
  # :::
  # services.adguardhome.settings = null;
  
  # Host address to bind HTTP server to.
  services.adguardhome.settings.bind_host = "0.0.0.0";
  
  # Port to serve HTTP pages on.
  services.adguardhome.settings.bind_port = 3000;
  
  # Schema version for the configuration.
  #
  # Defaults to the `schema_version` supplied by `pkgs.adguardhome`.
  #
  # services.adguardhome.settings.schema_version = pkgs.adguardhome.schema_version;

    services.tailscale.enable = true;
}