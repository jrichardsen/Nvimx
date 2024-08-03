{ lib
, config
, ...
}:
{
  options = {
    languages.lua.enable = lib.mkEnableOption "Lua language support" // { default = config.languages.enableAll; };
  };

  config = lib.mkIf config.languages.lua.enable {
    # TODO: more server configuration
    plugins.lsp.servers.lua-ls = {
      enable = true;
      extraOptions = {
        settings.Lua.completion.callSnippet = "Replace";
      };
    };
  };
}
