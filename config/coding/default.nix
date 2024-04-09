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
