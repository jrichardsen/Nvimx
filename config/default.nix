{ 
  helpers, 
  ... 
}:
{
  imports = [
    ./coding
    ./colorscheme
    ./editor
    ./lsp
    ./ui
  ];

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
  };
}
