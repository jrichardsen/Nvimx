{ pkgs, ... }:
{
  # NOTE: research tabs
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
        # NOTE: replace with list of some grammars for a more lightweight variant
        ensureInstalled = "all";
        indent = true;
      };
    };
    extraPlugins = with pkgs.vimPlugins; [
      # NOTE: evaluate how good this works
      vim-sleuth
      # NOTE: add this back in if required, otherwise delete it
      # plenary-nvim
    ];
  };
}
