{ 
  pkgs, 
  helpers, 
  ... 
}:
{

  config = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    clipboard.register = "unnamedplus";

    options = {
      number = true;
      mouse = "a";
      showmode = false;
      breakindent = true;
      undofile = true;
      ignorecase = true;
      smartcase = true;
      signcolumn = "yes";
      updatetime = 250;
      timeoutlen = 300;
      splitright = true;
      splitbelow = true;
      list = true;
      listchars = { 
        tab = "» ";
        trail = "·"; 
        nbsp = "␣"; 
      };
      inccommand = "split";
      cursorline = true;
      scrolloff = 10;
      hlsearch = true;
    };

    keymaps = [ 
      {
        mode = "n";
        key = "<Esc>";
        action = "<cmd>nohlsearch<CR>";
      }
      {
        mode = "n";
        key = "[d";
        action = "vim.diagnostic.goto_prev";
        lua = true;
        options = { desc = "Go to previous [D]iagnostic Message"; };
      } 
      {
        mode = "n";
        key = "]d";
        action = "vim.diagnostic.goto_next";
        lua = true;
        options = { desc = "Go to next [D]iagnostic Message"; };
      } 
      {
        mode = "n";
        key = "<leader>e";
        action = "vim.diagnostic.open_float";
        lua = true;
        options = { desc = "Show diagnostic [E]rror messages"; };
      } 
      {
        mode = "n";
        key = "<leader>q";
        action = "vim.diagnostic.setloclist";
        lua = true;
        options = { desc = "Open diagnostic [Q]uickfix list"; };
      }
      {
        mode = "t";
        key = "<Esc><Esc>";
        action = "<C-\\\\><C-n>";
        options = { desc = "Exit terminal mode"; };
      } 
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w><C-h>";
        options = { desc = "Move focus to the left window"; };
      } 
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w><C-l>";
        options = { desc = "Move focus to the right window"; };
      } 
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w><C-j>";
        options = { desc = "Move focus to the lower window"; };
      } 
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w><C-k>";
        options = { desc = "Move focus to the upper window"; };
      } 
      {
        mode = "n";
        key = "<leader>/";
        action = "function()
          require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
            winblend = 10,
            previewer = false,
          })
        end";
        lua = true;
        options = { desc = "[/] Fuzzily search in current buffer"; };
      }
      {
        mode = "n";
        key = "<leader>s/";
        action = "function()
          require('telescope.builtin').live_grep {
            grep_open_files = true,
            prompt_title = 'Live Grep in Open Files',
          }
        end";
        lua = true;
        options = { desc = "[S]earch [/] in Open Files"; };
      }
      {
        mode = "n";
        key = "<leader>sn";
        action = "function()
          require('telescope.builtin').find_files {
            cwd = vim.fn.stdpath 'config',
          }
        end";
        lua = true;
        options = { desc = "[S]earch [N]eovim files"; };
      }
    ] ++ (let 
      mkMap = keys: func: desc: {
          mode = "n";
          key = "${keys}";
          action = "${func}";
          lua = true;
          options.desc = "LSP: ${desc}";
        };
    in [
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
    ]);
    autoGroups = {
      kickstart-highlight-yank = {
        clear = true;
      };
    };
    autoCmd = [
      {
        event = "TextYankPost";
        desc = "Highlight when yanking (copying) text";
        group = "kickstart-highlight-yank";
        callback = helpers.mkRaw "function() vim.highlight.on_yank() end";
      }
    ];
    plugins = {
      comment-nvim.enable = true;
      gitsigns = {
        enable = true;
        signs = {
          add = { text = "+"; };
          change = { text = "~"; };
          delete = { text = "_"; };
          topdelete = { text = "‾"; };
          changedelete = { text = "~"; };
        };
      };
      which-key = {
        enable = true;
        registrations = {
          "<leader>c" = { name = "[C]ode"; _ = "which_key_ignore"; };
          "<leader>d" = { name = "[D]ocument"; _ = "which_key_ignore"; };
          "<leader>r" = { name = "[R]ename"; _ = "which_key_ignore"; };
          "<leader>s" = { name = "[S]earch"; _ = "which_key_ignore"; };
          "<leader>w" = { name = "[W]orkspace"; _ = "which_key_ignore"; };
        };
      };
      telescope = {
        enable = true;
        extensions = {
          fzf-native.enable = true;
          ui-select.enable = true;
        };
        keymaps = {
          "<leader>sh" = { action = "help_tags"; desc = "[S]earch [H]elp"; };
          "<leader>sk" = { action = "keymaps"; desc = "[S]earch [K]eymaps"; };
          "<leader>sf" = { action = "find_files"; desc = "[S]earch [F]iles"; };
          "<leader>ss" = { action = "builtin"; desc = "[S]earch [S]elect Telescope"; };
          "<leader>sw" = { action = "grep_string"; desc = "[S]earch current [W]ord"; };
          "<leader>sg" = { action = "live_grep"; desc = "[S]earch by [G]rep"; };
          "<leader>sd" = { action = "diagnostics"; desc = "[S]earch [D]iagnostics"; };
          "<leader>sr" = { action = "resume"; desc = "[S]earch [R]esume"; };
          "<leader>s." = { action = "oldfiles"; desc = "[S]earch Recent Files (\".\" for repeat)"; };
          "<leader><leader>" = { action = "buffers"; desc = "[ ] Find existing buffers"; };
        };
      };
      lsp = {
        enable = true;
        # FIXME: does not work
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
        servers = {
          lua-ls = {
            enable = true;
            extraOptions = {
              settings.Lua.completion.callSnippet = "Replace";
            };
          };
        };
      };
      fidget.enable = true;
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
      todo-comments = {
        enable = true;
        signs = false;
      };
      mini = {
        enable = true;
        modules = {
          ai = {
            n_lines = 500;
          };
          surround = { };
          statusline = { };
        };
      };
    };

    colorschemes.tokyonight = {
      enable = true;
      style = "night";
      styles.comments.italic = false;
    };

    extraPlugins = with pkgs.vimPlugins; [
      vim-sleuth
      plenary-nvim
    ];

    extraConfigLua = ''
      require('mini.statusline').section_location = function() return ''' end;
    '';
  };
}
