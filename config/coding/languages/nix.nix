{ pkgs
, lib
, config
, ...
}:
{
  options = {
    languages.nix.enable = lib.mkEnableOption "Nix language support" // { default = config.languages.enableAll; };
  };

  config = lib.mkIf config.languages.nix.enable {
    plugins.lsp.servers.nil-ls = {
      enable = true;
      settings.formatting.command = [ "${pkgs.nixfmt-rfc-style}/bin/nixfmt" ];
    };
    # NOTE: try to get nixd to work
  };
  # NOTE: keybind to quickly expand/collapse singleton attrs
  # NOTE: fix indentation
}
