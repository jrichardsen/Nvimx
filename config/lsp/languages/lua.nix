{
  config = {
    plugins.lsp.servers.lua-ls = {
      enable = true;
      extraOptions = {
        settings.Lua.completion.callSnippet = "Replace";
      };
    };
  };
}
