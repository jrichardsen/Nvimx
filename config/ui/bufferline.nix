{
  config,
  ...
}:
{
  config = {
    plugins.mini.modules.bufremove = { };
    plugins.bufferline = {
      enable = true;
      alwaysShowBufferline = false;
      closeCommand = ''function(n) require("mini.bufremove").delete(n, false) end'';
      diagnostics = "nvim_lsp";
      diagnosticsIndicator = let
        icons = config.style.symbols.diagnostics;
      in ''
        function(_, _, diag)
          local ret = (diag.error and "${icons.error}" .. diag.error .. " " or "")
            .. (diag.warning and "${icons.warn}" .. diag.warning or "")
          return vim.trim(ret)
        end
      '';
    };
  };
}
