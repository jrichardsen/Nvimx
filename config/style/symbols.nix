{
  config,
  lib,
  ...
}:
with lib;
{
  options.style.symbols = let
    mkSymbolOption = default: 
      mkOption { 
        type = types.str;
        inherit default; 
      };
  in {
     diagnostics = {
      error = mkSymbolOption "E";
      warn = mkSymbolOption "W";
      info = mkSymbolOption "I";
      hint = mkSymbolOption "H";
     };
     file = {
      modified = mkSymbolOption "[+]";
      readonly = mkSymbolOption "[-]";
      unnamed = mkSymbolOption "[No name]";
     };
     git = {
      added = mkSymbolOption "+";
      modified = mkSymbolOption "~";
      removed = mkSymbolOption "-";
     };
     gitsigns = {
      add = mkSymbolOption "+";
      change = mkSymbolOption "~";
      delete = mkSymbolOption "_";
      topdelete = mkSymbolOption "‾";
      changedelete = mkSymbolOption "~";
      untracked = mkSymbolOption "";
     };
  };

  config = {
    extraConfigLua = 
    let 
      symbols = config.style.symbols.diagnostics;
    in
    ''
      vim.fn.sign_define("DiagnosticSignError", { text = "${symbols.error}", texthl = "DiagnosticSignError" })
      vim.fn.sign_define("DiagnosticSignWarn", { text = "${symbols.warn}", texthl = "DiagnosticSignWarn" })
      vim.fn.sign_define("DiagnosticSignInfo", { text = "${symbols.info}", texthl = "DiagnosticSignInfo" })
      vim.fn.sign_define("DiagnosticSignHint", { text = "${symbols.hint}", texthl = "DiagnosticSignHint" })
    '';
  };
}
