{
  helpers,
  ...
}:
{
  config = {
    plugins = {
      nvim-cmp = {
        enable = true;
        snippet.expand = helpers.mkRaw "function(args) require('luasnip').lsp_expand(args.body) end";
        completion.completeopt = "menu,menuone,noinsert";
        mapping = {
          "<C-n>" = "cmp.mapping.select_next_item()";
          "<C-p>" = "cmp.mapping.select_prev_item()";
          "<C-y>" = "cmp.mapping.confirm { select = true }";
          "<C-Space>" = "cmp.mapping.complete {}";
          "<C-l>" = {
            action = "function() 
              if require('luasnip').expand_or_locally_jumpable() then
                require('luasnip').expand_or_jump()
              end
            end";
            modes = [ "i" "s" ]; 
          };
          "<C-h>" = {
            action = "function() 
              if require('luasnip').locally_jumpable(-1) then
                require('luasnip').jump(-1)
              end
            end";
            modes = [ "i" "s" ]; 
          };
        };
        autoEnableSources = true;
        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "path"; }
        ];
      };
      luasnip.enable = true;
    };
  };
}
