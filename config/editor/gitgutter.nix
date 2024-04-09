{
  config,
  ...
}:
{
  config = {
    plugins.gitsigns = {
      enable = true;
      settings = {
        signs = let
          symbols = config.style.symbols.gitsigns;
        in {
          add = { text = symbols.add; };
          change = { text = symbols.change; };
          delete = { text = symbols.delete; };
          topdelete = { text = symbols.topdelete; };
          changedelete = { text = symbols.changedelete; };
        };
      };
    };
  };
}
