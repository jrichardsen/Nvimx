{ lib
, config
, ...
}:
{
  # NOTE: improve language support
  options = {
    languages.rust.enable = lib.mkEnableOption "Rust language support" // { default = config.languages.enableByDefault; };
  };

  config = lib.mkIf config.languages.rust.enable {
    plugins.lsp.servers.rust-analyzer.enable = true;
  };
}
