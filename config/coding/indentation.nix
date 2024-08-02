{ pkgs, ... }:
{
  opts = {
    breakindent = true;
    expandtab = true;
    shiftwidth = 2;
    autoindent = true;
    tabstop = 2;
  };

  plugins.indent-blankline = {
    enable = true;
    settings = {
      indent = {
        char = "│";
        tab_char = "│";
      };
      scope = {
        show_start = false;
        show_end = false;
      };
      exclude.filetypes = [
        "dashboard"
      ];
    };
  };

  extraPlugins = with pkgs.vimPlugins; [
    vim-sleuth
  ];
}
