{
  config = {
    keymaps =
      let
        mkMap = key: func: desc: {
          mode = "n";
          inherit key;
          action.__raw = "${func}";
          options.desc = "LSP: ${desc}";
        };
      in
      [
        (mkMap "[d" "vim.diagnostic.goto_prev" "Go to previous [D]iagnostic Message")
        (mkMap "]d" "vim.diagnostic.goto_next" "Go to next [D]iagnostic Message")
        (mkMap "<leader>e" "vim.diagnostic.open_float" "Show diagnostic [E]rror messages")
        (mkMap "<leader>q" "vim.diagnostic.setloclist" "Open diagnostic [Q]uickfix list")
        (mkMap "gd" "require('telescope.builtin').lsp_definitions" "[G]oto [D]efinition")
        (mkMap "gD" "vim.lsp.buf.declaration" "[G]oto [D]eclaration")
        (mkMap "gr" "require('telescope.builtin').lsp_references" "[G]oto [R]eferences")
        (mkMap "gI" "require('telescope.builtin').lsp_implementations" "[G]oto [I]mplementations")
        (mkMap "gy" "require('telescope.builtin').lsp_type_definitions" "[G]oto T[y]pe Definitions")
        (mkMap "<leader>sd" "require('telescope.builtin').diagnostics" "[S]earch [D]iagnostics")
        (mkMap "<leader>ss" "require('telescope.builtin').lsp_document_symbols" "[S]earch [S]ymbols (document)")
        (mkMap "<leader>sS" "require('telescope.builtin').lsp_workspace_symbols" "[S]earch [S]ymbols (workspace)")
        (mkMap "<leader>ca" "vim.lsp.buf.code_action" "[C]ode [A]ction")
        (mkMap "<leader>cf" "function() require('conform').format { async = true, lsp_fallback = true } end" "[C]ode [F]ormat")
        (mkMap "<leader>cr" "vim.lsp.buf.rename" "[C]ode [R]ename")
        (mkMap "K" "vim.lsp.buf.hover" "Hover Documentation")
      ];
    plugins = {
      lsp = {
        enable = true;
        onAttach = ''
          if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = bufnr,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = bufnr,
              callback = vim.lsp.buf.clear_references,
            })
          end
        '';
        capabilities = "capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())";
      };
      fidget.enable = true;
      conform-nvim = {
        enable = true;
        formattersByFt = {
          # Formatters to run for filetypes that do not have other formatters configured
          "_" = [ "trim_whitespace" ];
        };
      };
    };
    opts.formatexpr = "v:lua.require'conform'.formatexpr()";
    opts.formatoptions = "jcroqlnt";
  };
}
