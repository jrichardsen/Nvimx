{ config, ... }:
{
  # TODO: add keybindings
  # TODO: configure correctly
  config = {
    plugins.trouble = {
      enable = true;
      settings = {
        icons = config.style.enableIcons;
        use_diagnostic_signs = true;
      };
    };
    # configure signs for diagnostics
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
