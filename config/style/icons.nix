{ lib, config, ... }:
with lib;
let
  cfg = config.style;
in
{
  options.style.icons.enable = mkOption {
    default = true;
    example = false;
    description = "Whether to enable icons.";
    type = lib.types.bool;
  };

  config = mkIf cfg.icons.enable {
    style.symbols = {
      comments = {
        fix = " ";
        todo = " ";
        hack = " ";
        warn = " ";
        perf = " ";
        note = " ";
        test = " ";
      };
      dashboard = {
        find_file = " ";
        new_file = " ";
        recent_files = " ";
        find_text = " ";
        restore_session = " ";
        quit = " ";
      };
      diagnostics = {
        error = " ";
        warn = " ";
        info = " ";
        hint = " ";
      };
      file = {
        modified = " ";
        readonly = " ";
      };
      git = {
        added = " ";
        modified = " ";
        removed = " ";
      };
      gitsigns = {
        add = "▎";
        change = "▎";
        delete = "";
        topdelete = "";
        changedelete = "▎";
        untracked = "▎";
      };
    };
  };
}
