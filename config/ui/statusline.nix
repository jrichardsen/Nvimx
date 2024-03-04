{
  config = {
    plugins.mini = {
      enable = true;
      modules.statusline = { };
    };

    extraConfigLua = ''
      require('mini.statusline').section_location = function() return ''' end;
    '';
  };
}
