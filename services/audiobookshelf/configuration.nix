{
  # Enable the audiobookshelf service
  services.audiobookshelf.enable = true;
  
  # Path to Audiobookshelf config and metadata inside of /var/lib.
  services.audiobookshelf.dataDir =  "audiobookshelf";
  
  # The host Audiobookshelf binds to.
  # services.audiobookshelf.host =  "127.0.0.1";
  
  # Open ports in the firewall for the Audiobookshelf web interface.
  # services.audiobookshelf.openFirewall =  false;
  
  # The audiobookshelf package to use.
  # services.audiobookshelf.package =  pkgs.audiobookshelf;
  
  # The TCP port Audiobookshelf will listen on.
  services.audiobookshelf.port =  8000;
  
  # User account under which Audiobookshelf runs.
  services.audiobookshelf.user = "nixserver-service";
  
  # Group under which Audiobookshelf runs.
  services.audiobookshelf.group = "nixserver-service";
}