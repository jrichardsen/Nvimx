{ lib, config, ... }:
{
  config = {
    # TODO: maybe some visualization of indentation settings
    plugins.lualine =
      let
        symbols = config.style.symbols;
        enableIcons = config.style.enableIcons;
      in
      {
        enable = true;
        iconsEnabled = enableIcons;
        sections = {
          lualine_a = [ "mode" ];
          lualine_b = [ "branch" ];
          lualine_c = [
            {
              name = "diff";
              extraConfig.symbols = {
                added = symbols.git.added;
                modified = symbols.git.modified;
                removed = symbols.git.removed;
              };
            }
            (lib.mkIf enableIcons {
              name = "filetype";
              extraConfig = {
                icon_only = true;
                separator = "";
                padding = {
                  left = 1;
                  right = 0;
                };
              };
            })
            {
              name = "filename";
              extraConfig = {
                path = 1;
                symbols = {
                  modified = symbols.file.modified;
                  readonly = symbols.file.readonly;
                  unnamed = symbols.file.unnamed;
                };
              };
            }
          ];
          lualine_x = [
            {
              name = "diagnostics";
              extraConfig.symbols = {
                error = symbols.diagnostics.error;
                warn = symbols.diagnostics.warn;
                info = symbols.diagnostics.info;
                hint = symbols.diagnostics.hint;
              };
            }
          ];
          lualine_y = [ "progress" ];
          lualine_z = [ "location" ];
        };
      };
  };
}
