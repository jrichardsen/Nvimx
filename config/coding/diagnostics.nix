{ config
, utils
, helpers
, ...
}:
{
  config = {
    # NOTE: do we want trouble?
    #
    # plugins.trouble = {
    #   enable = true;
    #   settings = {
    #     icons = config.style.enableIcons;
    #     use_diagnostic_signs = true;
    #   };
    # };
    plugins.lsp.keymaps.extra = [
      (utils.mkLuaMapN "[d" "vim.diagnostic.goto_prev" "Go to previous [D]iagnostic Message")
      (utils.mkLuaMapN "]d" "vim.diagnostic.goto_next" "Go to next [D]iagnostic Message")
      (utils.mkLuaMapN "<leader>cd" "vim.diagnostic.open_float" "Show [C]ode Line [D]iagnostics")
      (utils.mkLuaMapN "<leader>sd" "require('telescope.builtin').diagnostics" "[S]earch [D]iagnostics")
    ];
    # configure signs for diagnostics
    diagnostics = {
      virtual_text = {
        spacing = 4;
        source = "if_many";
        prefix = "●";
      };
      severity_sort = true;
      signs = {
        text =
          let
            symbols = config.style.symbols.diagnostics;
          in
          helpers.mkRaw ''{
            [vim.diagnostic.severity.ERROR] = "${symbols.error}";
            [vim.diagnostic.severity.WARN] = "${symbols.warn}";
            [vim.diagnostic.severity.HINT] = "${symbols.hint}";
            [vim.diagnostic.severity.INFO] = "${symbols.info}";
          }'';
      };
    };
  };
}
