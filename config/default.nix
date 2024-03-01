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

    options = {
      number = true;
      mouse = "a";
      showmode = false;
      clipboard = "unnamedplus";
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
        options = { desc = "Go to previous [D]iagnostic Message"; };
      } 
      {
        mode = "n";
        key = "]d";
        action = "vim.diagnostic.goto_next";
        options = { desc = "Go to next [D]iagnostic Message"; };
      } 
      {
        mode = "n";
        key = "<leader>e";
        action = "vim.diagnostic.open_float";
        options = { desc = "Show diagnostic [E]rror messages"; };
      } 
      {
        mode = "n";
        key = "<leader>q";
        action = "vim.diagnostic.setloclist";
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
    ];
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
    };
    extraPlugins = with pkgs.vimPlugins; [
      vim-sleuth
    ];
  };
}
