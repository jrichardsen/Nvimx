{ lib, config, ... }:
{
  # NOTE: add more languages
  #   - python
  #   - jupyter-notebook support?
  #   - ...

  imports = [
    ./c.nix
    ./haskell.nix
    ./latex.nix
    ./nix.nix
    ./rust.nix
  ];

  options = {
    languages.enableByDefault = lib.mkOption {
      type = lib.types.bool;
      description = "Enables support for all available languages by default.
      Can be overridden for individual languages by setting
      `languages.<language>.enable`.";
      default = true;
    };
  };

  config = {
    languages =
      let
        default = lib.mkDefault config.languages.enableByDefault;
      in
      {
        c.enable = default;
        haskell.enable = default;
        latex.enable = default;
        nix.enable = default;
        rust.enable = default;
      };
  };
}
