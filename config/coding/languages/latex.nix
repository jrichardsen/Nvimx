{ lib
, config
, ...
}:
{
  # NOTE: improve language support
  options = {
    languages.latex.enable = lib.mkEnableOption "LaTeX language support";
  };

  config = lib.mkIf config.languages.latex.enable {
    plugins.lsp.servers.texlab = {
      enable = true;
      # TODO: test this
      settings = {
        texlab = {
          build = {
            args = [ "-pdf" "-view=pdf" "-interaction=nonstopmode" "--shell-escape" "-synctex=1" "%f" ];
            onSave = true;
            forwardSearchAfter = true;
          };
          forwardSearch = {
            executable = "zathura";
            args = [ "--synctex-forward" "%l:1:%f" "%p" ];
          };
        };
      };
    };
  };
}
