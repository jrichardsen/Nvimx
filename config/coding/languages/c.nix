{ lib
, config
, ...
}:
{
  # NOTE: improve language support
  options = {
    languages.c.enable = lib.mkEnableOption "C/C++ language support";
  };

  config = lib.mkIf config.languages.c.enable {
    plugins.lsp.servers.clangd.enable = true;
  };
}
