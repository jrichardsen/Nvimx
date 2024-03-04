{
  helpers,
  ...
}:
{
  imports = [
    ./autocompletions.nix
  ];

  config = {
    plugins = {
      comment-nvim.enable = true;
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
