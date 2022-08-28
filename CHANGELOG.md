## [Unreleased]

## [0.2.0] - 2022-08-27

- Replaces the use of `::Kernel.require` with `::Kernel.load` and replaces the `$LOADED_FEATURES` tracking with an internally maintained `Set` for better Zeitwerk (Rails autoloading) inter op. See https://github.com/kaspth/conventional_extensions/pull/2

## [0.1.0] - 2022-08-27

- Initial release
