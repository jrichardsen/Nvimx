{
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
}
