{
  config = {
    plugins.which-key = {
      enable = true;
      registrations =
        let
          register = name: {
            inherit name;
            _ = "which_key_ignore";
          };
        in
        {
          "<leader>b" = register "[B]uffers";
          "<leader>c" = register "[C]ode";
          "<leader>d" = register "[D]ocument";
          "<leader>r" = register "[R]ename";
          "<leader>s" = register "[S]earch";
          "<leader>w" = register "[W]orkspace";
        };
    };
  };
}
