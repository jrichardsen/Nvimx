{ lib, config, ... }:
with lib;
let
  cfg = config.style;
in
{
  # TODO: verify that disabling this options actually removes all icons
  options.style.enableIcons = mkEnableOption "icons";

  # NOTE: mini icons?
  config = mkIf cfg.enableIcons {
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
