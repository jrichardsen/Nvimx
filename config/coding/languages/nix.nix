{ pkgs
, ...
}:
{
  config = {
    plugins.lsp.servers.nil-ls = {
      enable = true;
      settings.formatting.command = [ "${pkgs.nixfmt-rfc-style}/bin/nixfmt" ];
    };
    # INFO: try to get nixd to work
  };
}
