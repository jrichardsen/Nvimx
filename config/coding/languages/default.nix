{ lib
, ...
}:
{
  # TODO: add more languages
  #   - rust
  #   - latex
  #   - c/c++ (clangd)
  #   - python
  #   - jupyter-notebook support?
  #   - ...

  imports = [
    ./lua.nix
    ./nix.nix
  ];

  options = { 
    languages.enableAll = lib.mkOption {
      type = lib.types.bool;
      description = "Enables support for all available languages by default.
      Can be overridden for individual languages by setting
      `languages.<language>.enable`.";
      default = true;
    };
  };
}
