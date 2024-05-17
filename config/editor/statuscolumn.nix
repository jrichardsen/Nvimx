{
  config,
  ...
}:
{
  config = {
    plugins.statuscol = {
      enable = true;
      settings = {
        reculright = true;
        segments = [
          { sign = { name = [ ".*" ]; }; }
          { 
            text = [ {__raw = "require('statuscol.builtin').lnumfunc";} " " ];
            condition = [ true {__raw = "require('statuscol.builtin').not_empty";} ];
          }
          { sign = { namespace = [ "gitsign" ]; }; colwidth = 1; }
        ];
      };
    };

    plugins.marks.enable = true;

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
