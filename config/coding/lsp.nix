{
  config = {
    keymaps =
      let
        mkMap = keys: func: desc: {
          mode = "n";
          key = "${keys}";
          action = "${func}";
          lua = true;
          options.desc = "LSP: ${desc}";
        };
      in
      [
        (mkMap "[d" "vim.diagnostic.goto_prev" "Go to previous [D]iagnostic Message")
        (mkMap "]d" "vim.diagnostic.goto_next" "Go to next [D]iagnostic Message")
        (mkMap "<leader>e" "vim.diagnostic.open_float" "Show diagnostic [E]rror messages")
        (mkMap "<leader>q" "vim.diagnostic.setloclist" "Open diagnostic [Q]uickfix list")
        (mkMap "gd" "require('telescope.builtin').lsp_definitions" "[G]oto [D]efinition")
        (mkMap "gr" "require('telescope.builtin').lsp_references" "[G]oto [R]eferences")
        (mkMap "gI" "require('telescope.builtin').lsp_implementations" "[G]oto [I]mplementations")
        (mkMap "<leader>D" "require('telescope.builtin').lsp_type_definitions" "Type [D]efinitions")
        (mkMap "<leader>ds" "require('telescope.builtin').lsp_document_symbols" "[D]ocument [S]ymbols")
        (mkMap "<leader>ws" "require('telescope.builtin').lsp_workspace_symbols" "[W]orkspace [S]ymbols")
        (mkMap "<leader>rn" "vim.lsp.buf.rename" "[R]e[n]ame")
        (mkMap "<leader>ca" "vim.lsp.buf.code_action" "[C]ode [A]ction")
        (mkMap "K" "vim.lsp.buf.hover" "Hover Documentation")
        (mkMap "gD" "vim.lsp.buf.declaration" "[G]oto [D]eclaration")
        (mkMap "<leader>cf" "function() require('conform').format { async = true, lsp_fallback = true } end" "[C]ode [F]ormat")
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
  };
}
