{
  # Enable the shiori service
  services.shiori.enable = true;
  
  # The IP address on which Shiori will listen.
  #
  # If empty, listens on all interfaces.
  #
  # services.shiori.address = "";
  
  # The Shiori package to use.
  # services.shiori.package = pkgs.shiori;
  
  # The port of the Shiori web application
  services.shiori.port = 8080;
  
  # The root of the Shiori web application
  # services.shiori.webRoot = "/";
    services.tailscale.enable = true;
}