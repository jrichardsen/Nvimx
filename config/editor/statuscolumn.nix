{ config
, helpers
, ...
}:
{
  config = {
    plugins.statuscol = {
      enable = true;
      settings = {
        reculright = true;
        segments = [
          {
            sign = {
              name = [ ".*" ];
            };
          }
          {
            text = [
              (helpers.mkRaw "require('statuscol.builtin').lnumfunc")
              " "
            ];
            condition = [
              true
              (helpers.mkRaw "require('statuscol.builtin').not_empty")
            ];
          }
          {
            sign = {
              namespace = [ "gitsign" ];
            };
            colwidth = 1;
          }
        ];
      };
    };

    # TODO: checkout plugin options
    plugins.marks.enable = true;

    # TODO: add keybinds and maybe move this to coding/git or something similar
    plugins.gitsigns = {
      enable = true;
      settings =
        let
          symbols = config.style.symbols.gitsigns;
          signs =
            {
              add = {
                text = symbols.add;
              };
              change = {
                text = symbols.change;
              };
              delete = {
                text = symbols.delete;
              };
              topdelete = {
                text = symbols.topdelete;
              };
              changedelete = {
                text = symbols.changedelete;
              };
            };
        in
        {
          inherit signs;
          signs_staged = signs;
        };
    };
  };
}
