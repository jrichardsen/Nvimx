{ pkgs, ... }:
{
  # INFO: research tabs
  # TODO: hotkeys for toggling
  imports = [
    ./bufferline.nix
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
        # TODO: check if we need more or add option to just install all of them on systems with sufficient storage
        ensureInstalled = [
          "bash"
          "c"
          "html"
          "lua"
          "markdown"
          "vim"
          "vimdoc"
        ];
        indent = true;
      };
    };
    extraPlugins = with pkgs.vimPlugins; [
      # TODO: evaluate how good this works
      vim-sleuth
      # TODO: add this back in if required, otherwise delete it
      # plenary-nvim
    ];
  };
}
