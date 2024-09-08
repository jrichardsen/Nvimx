{ lib
, config
, ...
}:
{
  # NOTE: improve language support
  options = {
    languages.haskell.enable = lib.mkEnableOption "Haskell language support" // { default = config.languages.enableByDefault; };
  };

  config = lib.mkIf config.languages.haskell.enable {
    plugins.lsp.servers.hls.enable = true;
  };
}
