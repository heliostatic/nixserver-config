{
  # Enable the healthchecks service
  services.healthchecks.enable = true;
  
  # The directory used to store all data for healthchecks.
  #
  # ::: {.note}
  # If left as the default value this directory will automatically be created before
  # the healthchecks server starts, otherwise you are responsible for ensuring the
  # directory exists with appropriate ownership and permissions.
  #
  # :::
  services.healthchecks.dataDir = "/var/lib/healthchecks";
  
  # Address the server will listen on.
  services.healthchecks.listenAddress =  "localhost";
  
  # healthchecks package to use.
  services.healthchecks.package =  pkgs.healthchecks;
  
  # Port the server will listen on.
  services.healthchecks.port =  8000;
  
  # Environment variables which are read by healthchecks `(local)_settings.py`.
  #
  # Settings which are explicitly covered in options below, are type-checked and/or transformed
  # before added to the environment, everything else is passed as a string.
  #
  # See <https://healthchecks.io/docs/self_hosted_configuration/>
  # for a full documentation of settings.
  #
  # We add additional variables to this list inside the packages `local_settings.py.`
  # - `STATIC_ROOT` to set a state directory for dynamically generated static files.
  #
  # - `SECRET_KEY_FILE` to read `SECRET_KEY` from a file at runtime and keep it out of
  #   /nix/store.
  #
  # - `_FILE` variants for several values that hold sensitive information in
  #   [Healthchecks configuration](https://healthchecks.io/docs/self_hosted_configuration/) so
  #   that they also can be read from a file and kept out of /nix/store. To see which values
  #   have support for a `_FILE` variant, run:
  #   - `nix-instantiate --eval --expr '(import <nixpkgs> {}).healthchecks.secrets'`
  #   - or `nix eval 'nixpkgs#healthchecks.secrets'` if the flake support has been enabled.
  #
  # Type: attribute set of string
  # services.healthchecks.settings = {};
  
  # The host/domain names that this site can serve.
  # services.healthchecks.settings.ALLOWED_HOSTS =  [
  #   "*"
  # ];
  
  # Database engine to use.
  services.healthchecks.settings.DB =  "sqlite";
  
  # Database name.
  services.healthchecks.settings.DB_NAME =  if config.services.healthchecks.settings.DB == "sqlite"
    then "${config.services.healthchecks.dataDir}/healthchecks.sqlite"
  else "hc";
  
  # Enable debug mode.
  # services.healthchecks.settings.DEBUG =  false;
  
  # A boolean that controls whether site visitors can create new accounts.
  #
  # Set it to false if you are setting up a private Healthchecks instance,
  # but it needs to be publicly accessible (so, for example, your cloud
  # services can send pings to it).
  #
  # If you close new user registration, you can still selectively invite
  # users to your team account.
  #
  services.healthchecks.settings.REGISTRATION_OPEN =  false;
  
  # Path to a file containing the secret key.
  # Type: path
  # services.healthchecks.settings.SECRET_KEY_FILE = pkgs.readSecret "healthchecks";
  
  # User account under which healthchecks runs.
  #
  # ::: {.note}
  # If left as the default value this user will automatically be created
  # on system activation, otherwise you are responsible for
  # ensuring the user exists before the healthchecks service starts.
  #
  # :::
  services.healthchecks.user = "nixserver-service";
  
  # Group account under which healthchecks runs.
  #
  # ::: {.note}
  # If left as the default value this group will automatically be created
  # on system activation, otherwise you are responsible for
  # ensuring the group exists before the healthchecks service starts.
  #
  # :::
  services.healthchecks.group = "nixserver-service";

  services.tailscale.enable = true;
}