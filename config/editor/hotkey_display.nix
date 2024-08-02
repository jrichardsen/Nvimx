{
  config = {
    plugins.which-key = {
      enable = true;
      settings.spec =
        let
          register = keys: desc: {
            __unkeyed-1 = keys;
            inherit desc;
          };
        in
        [
          (register "<leader>b" "[B]uffers")
          (register "<leader>c" "[C]ode")
          (register "<leader>s" "[S]earch")
          (register "<leader>w" "[W]indows")
        ];
    };
  };
}
