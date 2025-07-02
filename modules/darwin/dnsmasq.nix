{ ... }:
{
  services.dnsmasq = {
    enable = true;
    addresses = {
      "local.deepstaging.com" = "127.0.0.1";
      "local.starter-template.com" = "127.0.0.1";
    };
  };
}
