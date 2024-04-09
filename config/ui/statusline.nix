{
  config = {
    plugins.lualine = {
      enable = true;
      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [ 
          "branch"  
          {
            name = "diff";
            extraConfig.symbols = {
              # TODO: add symbols
            };
          }
        ];
        lualine_c = [ 
          {
            name = "filetype"; 
            extraConfig = {
              icon_only = true;
              separator = "";
              padding = { left = 1; right = 0; };
            };
          }
          {
            name = "filename";
            extraConfig = {
              path = 1;
              symbols = {
                # TODO: add symbols
              };
            };
          }
        ];
        lualine_x = [
          {
            name = "diagnostics";
            extraConfig.symbols = { 
              # TODO: add symbols
            };
          }
        ];
        lualine_y = [ "progress" ];
        lualine_z = [ "location" ];
      };
    };
  };
}
