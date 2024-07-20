{ helpers
, pkgs
, ...
}:
{
  # TODO: check for useful stuff in lazyvim
  imports = [
    ./coding
    ./editor
    ./style
  ];

  config = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    clipboard.register = "unnamedplus";

    opts = {
      autowrite = true;
      breakindent = true;
      confirm = true;
      cursorline = true;
      expandtab = true;
      grepformat = "%f:%l:%c:%m";
      grepprg = "${pkgs.ripgrep}/bin/rg --vimgrep";
      hlsearch = false;
      ignorecase = true;
      inccommand = "split";
      laststatus = 3;
      linebreak = true;
      list = true;
      listchars = {
        tab = "» ";
        trail = "·";
        nbsp = "␣";
      };
      mouse = "a";
      number = true;
      relativenumber = true;
      scrolloff = 10;
      shiftround = true;
      shiftwidth = 2;
      showmode = false;
      signcolumn = "yes";
      smartcase = true;
      smartindent = true;
      splitbelow = true;
      splitright = true;
      tabstop = 2;
      termguicolors = true;
      timeoutlen = 300;
      undofile = true;
      updatetime = 250;
      virtualedit = "block";
      wrap = true;
    };

    keymaps = [
      {
        mode = "t";
        key = "<Esc><Esc>";
        action = "<C-\\\\><C-n>";
        options.desc = "Exit terminal mode";
      }
      {
        mode = [ "n" "x" ];
        key = "j";
        action = "v:count == 0 ? 'gj' : 'j'";
        options = {
          desc = "Down";
          expr = true;
          silent = true;
        };
      }
      {
        mode = [ "n" "x" ];
        key = "k";
        action = "v:count == 0 ? 'gk' : 'k'";
        options = {
          desc = "Up";
          expr = true;
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w><C-h>";
        options.desc = "Go to Left Window";
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w><C-l>";
        options.desc = "Go to Right Window";
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w><C-j>";
        options.desc = "Go to Lower Window";
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w><C-k>";
        options.desc = "Go to Upper Window";
      }
      {
        mode = "n";
        key = "<C-Up>";
        action = "<cmd>resize +2<cr>";
        options.desc = "Increase Window Height";
      }
      {
        mode = "n";
        key = "<C-Down>";
        action = "<cmd>resize -2<cr>";
        options.desc = "Decrease Window Height";
      }
      {
        mode = "n";
        key = "<C-Left>";
        action = "<cmd>vertical resize -2<cr>";
        options.desc = "Decrease Window Width";
      }
      {
        mode = "n";
        key = "<C-Right>";
        action = "<cmd>vertical resize +2<cr>";
        options.desc = "Increase Window Width";
      }
      {
        mode = "n";
        key = "<A-j>";
        action = "<cmd>m .+1<cr>==";
        options.desc = "Move Line Down";
      }
      {
        mode = "n";
        key = "<A-k>";
        action = "<cmd>m .-2<cr>==";
        options.desc = "Move Line Up";
      }
      {
        mode = "i";
        key = "<A-j>";
        action = "<esc><cmd>m .+1<cr>==gi";
        options.desc = "Move Line Down";
      }
      {
        mode = "i";
        key = "<A-k>";
        action = "<esc><cmd>m .-2<cr>==gi";
        options.desc = "Move Line Up";
      }
      {
        mode = "v";
        key = "<A-j>";
        action = "<cmd>m '>+1<cr>gv=gv";
        options.desc = "Move Line Down";
      }
      {
        mode = "v";
        key = "<A-k>";
        action = "<cmd>m '<-2<cr>gv=gv";
        options.desc = "Move Line Up";
      }
      {
        mode = "n";
        key = "<leader>ur";
        action = "<cmd>nohlsearch<bar>diffupdate<bar>normal! <C-L><CR>";
        options.desc = "Redraw / Clear hlsearch / Diff Update";
      }
      {
        mode = "i";
        key = ",";
        action = ",<c-g>u";
      }
      {
        mode = "i";
        key = ".";
        action = ".<c-g>u";
      }
      {
        mode = "i";
        key = ";";
        action = ";<c-g>u";
      }
    ];
    autoGroups = {
      highlight-yank = {
        clear = true;
      };
    };
    autoCmd = [
      {
        event = "TextYankPost";
        desc = "Highlight when yanking (copying) text";
        group = "highlight-yank";
        callback = helpers.mkRaw "function() vim.highlight.on_yank() end";
      }
    ];
  };
}
