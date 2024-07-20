{ config
, helpers
, ...
}:
{
  config = {
    keymaps =
      let
        mkMap = key: action: desc: {
          mode = "n";
          inherit key;
          inherit action;
          options = { inherit desc; };
        };
      in
      [
        (mkMap "<leader>bb" "<cmd>edit #<cr>" "Switch to oher buffer")
        (mkMap "<leader>bd" (helpers.mkRaw ''function() require("mini.bufremove").delete(0, false) end'') "Delete buffer")
        (mkMap "<leader>bD" "<cmd>bdelete<cr>" "Delete buffer and window")
        (mkMap "<leader>bp" "<cmd>BufferLineTogglePin<cr>" "Toggle Pin")
        (mkMap "<leader>bP" "<cmd>BufferLineGroupClose ungrouped<cr>" "Delete Non-Pinned Buffers")
        (mkMap "<leader>bo" "<cmd>BufferLineCloseOthers<cr>" "Delete Other Buffers")
        (mkMap "<leader>bl" "<cmd>BufferLineCloseRight<cr>" "Delete Buffers to the Right")
        (mkMap "<leader>bh" "<cmd>BufferLineCloseLeft<cr>" "Delete Buffers to the Left")
        (mkMap "<S-h>" "<cmd>BufferLineCyclePrev<cr>" "Prev Buffer")
        (mkMap "<S-l>" "<cmd>BufferLineCycleNext<cr>" "Next Buffer")
        (mkMap "[b" "<cmd>BufferLineCyclePrev<cr>" "Prev Buffer")
        (mkMap "]b" "<cmd>BufferLineCycleNext<cr>" "Next Buffer")
        (mkMap "[B" "<cmd>BufferLineMovePrev<cr>" "Move buffer prev")
        (mkMap "]B" "<cmd>BufferLineMoveNext<cr>" "Move buffer next")
      ];
    plugins.mini.modules.bufremove = { };
    plugins.bufferline = {
      enable = true;
      alwaysShowBufferline = false;
      closeCommand = ''function(n) require("mini.bufremove").delete(n, false) end'';
      diagnostics = "nvim_lsp";
      diagnosticsIndicator =
        let
          icons = config.style.symbols.diagnostics;
        in
        ''
          function(_, _, diag)
            local ret = (diag.error and "${icons.error}" .. diag.error .. " " or "")
              .. (diag.warning and "${icons.warn}" .. diag.warning or "")
            return vim.trim(ret)
          end
        '';
    };
  };
}
