{ lib
, ...
}:
{
  # NOTE: add more languages
  #   - python
  #   - jupyter-notebook support?
  #   - ...

  imports = [
    ./c.nix
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
}
