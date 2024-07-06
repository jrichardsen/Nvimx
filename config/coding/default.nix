{
  # TODO: filetype specific settings
  imports = [
    ./autocompletions.nix
    ./diagnostics.nix
    ./languages
    ./lsp.nix
  ];

  config = {
    plugins = {
      comment.enable = true;
      mini = {
        enable = true;
        modules = {
          ai = {
            n_lines = 500;
          };
          surround = { };
        };
      };
    };
  };
}
