{
  config,
  ...
}:
{
  config = {
    plugins.trouble = {
      enable = true;
      settings = {
        icons = config.style.enableIcons;
        use_diagnostic_signs = true;
      };
    };
  };
}
