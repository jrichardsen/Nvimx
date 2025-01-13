# Nixvim template

This template gives you a good starting point for configuring nixvim standalone.

## Archive notice

This repository has moved and is now part of [my system repository](https://github.com/jrichardsen/my-nixos).

## Configuring

To start configuring, just add or modify the nix files in `./config`.
If you add a new configuration file, remember to add it to the
[`config/default.nix`](./config/default.nix) file

## Testing your new configuration

To test your configuration simply run the following command

```
nix run .
```
