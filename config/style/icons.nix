{
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.style;
in {
  options.style.enableIcons = mkEnableOption "icons";

  config = mkIf cfg.enableIcons {
    style.symbols = {
      diagnostics = {
        error = " ";
        warn = " ";
        hint = " ";
        info = " ";
      };
      file = {
        modified = " ";
        readonly = "󰌾 ";
      };
      git = {
        added = " ";
        modified = " ";
        removed  = " ";
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
