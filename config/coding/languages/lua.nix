{
  config = {
    # TODO: more server configuration
    plugins.lsp.servers.lua-ls = {
      enable = true;
      extraOptions = {
        settings.Lua.completion.callSnippet = "Replace";
      };
    };
  };
}
