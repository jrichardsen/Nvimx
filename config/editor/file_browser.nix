{ config
, lib
, utils
, helpers
, ...
}:
{
  config = {
    # NOTE: git aware file operations
    plugins.oil = {
      enable = true;
      settings = {
        columns =
          lib.optional config.style.enableIcons "icon";
        keymaps = {
          "<leader>f?" = "actions.show_help";
          "-" = "actions.parent";
          "<leader>fq" = "actions.close";
          "<CR>" = "actions.select";
          "<leader>f-" = "actions.select_split";
          "<leader>f|" = "actions.select_vsplit";
          "<leader>ft" = "actions.select_tab";
          "<leader>fp" = "actions.preview";
          "<leader>fr" = "actions.refresh";
          _ = "actions.open_cwd";
          "`" = "actions.cd";
          "~" = "actions.tcd";
          "<leader>f." = "actions.toggle_hidden";
          "<leader>f\\" = "actions.toggle_trash";
          "<leader>fs" = "actions.change_sort";
          "<leader>fd" = {
            desc = "Toggle detail view";
            callback = helpers.mkRaw ''
              function()
                local oil = require("oil")
                local config = require("oil.config")
                if #config.columns <= 1 then
                  oil.set_columns({${if config.style.enableIcons then " \"icon\"," else ""} "permissions", "size", "mtime" })
                else
                  oil.set_columns({${if config.style.enableIcons then " \"icon\"" else ""} })
                end
              end
            '';
          };
          "<leader>fx" = "actions.open_external";
        };
        use_default_keymaps = false;
        # NOTE: lsp file method
      };
    };

    keymaps = [
      (utils.mkCmdMapN "-" "<cmd>Oil<cr>" "Open parent directory")
    ];
  };
}
