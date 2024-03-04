{
  pkgs,
  ...
}:
{
  imports = [
    ./fuzzy_finder.nix
    ./gitgutter.nix
  ];

  config = {
    plugins = {
      todo-comments = {
        enable = true;
        signs = false;
      };
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
