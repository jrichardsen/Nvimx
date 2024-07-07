{
  config = {
    plugins = {
      cmp = {
        enable = true;
        settings = {
          snippet.expand = ''
            function(args)
              require('luasnip').lsp_expand(args.body)
            end
          '';
          completion.completeopt = "menu,menuone,noinsert";
          mapping = {
            "<C-n>" = "cmp.mapping.select_next_item()";
            "<C-p>" = "cmp.mapping.select_prev_item()";
            "<C-y>" = "cmp.mapping.confirm { select = true }";
            "<C-Space>" = "cmp.mapping.complete {}";
            "<C-l>" = "function() 
              if require('luasnip').expand_or_locally_jumpable() then
                require('luasnip').expand_or_jump()
              end
            end";
            "<C-h>" = "function() 
              if require('luasnip').locally_jumpable(-1) then
                require('luasnip').jump(-1)
              end
            end";
          };
          # NOTE: add buffer as completion source, maybe configurable via toggle?
          sources = [
            { name = "nvim_lsp"; }
            { name = "luasnip"; }
            { name = "path"; }
          ];
        };
      };
      luasnip.enable = true;
    };
  };
}
