{
  pkgs,
  ...
}:
{
  imports = [
    ./fuzzy_finder.nix
    ./statuscolumn.nix
  ];

  config = {
    plugins = {
      todo-comments.enable = true;
      treesitter = {
        enable = true;
        ensureInstalled = [ "bash" "c" "html" "lua" "markdown" "vim" "vimdoc" ];
        indent = true;
      };
    };
    extraPlugins = with pkgs.vimPlugins; [
      vim-sleuth
      plenary-nvim
    ];
  };
}
