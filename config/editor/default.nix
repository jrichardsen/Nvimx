{ pkgs, ... }:
{
  # INFO: research tabs
  # TODO: hotkeys for ui
  imports = [
    ./buffers.nix
    ./fuzzy_finder.nix
    ./hotkey_display.nix
    ./statuscolumn.nix
    ./statusline.nix
  ];

  config = {
    plugins = {
      todo-comments.enable = true;
      treesitter = {
        enable = true;
        # INFO: replace with list of some grammars for a more lightweight variant
        ensureInstalled = "all";
        indent = true;
      };
    };
    extraPlugins = with pkgs.vimPlugins; [
      # INFO: evaluate how good this works
      vim-sleuth
      # INFO: add this back in if required, otherwise delete it
      # plenary-nvim
    ];
  };
}
