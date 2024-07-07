{ pkgs
, ...
}:
{
  config = {
    plugins.lsp.servers.nil-ls = {
      enable = true;
      settings.formatting.command = [ "${pkgs.nixfmt-rfc-style}/bin/nixfmt" ];
    };
    # NOTE: try to get nixd to work
  };
}
