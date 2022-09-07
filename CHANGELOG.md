## [Unreleased]

## [0.2.1] - 2022-09-07

- Fixes `extend ConventionalExtensions.load_on_inherited` not finding the right directory to load extensions from. See https://github.com/kaspth/conventional_extensions/commit/1f6fe9cbf2fe44ed9d699a5dd485eaa366d875a4

## [0.2.0] - 2022-08-27

- Replaces the use of `::Kernel.require` with `::Kernel.load` and replaces the `$LOADED_FEATURES` tracking with an internally maintained `Set` for better Zeitwerk (Rails autoloading) inter op. See https://github.com/kaspth/conventional_extensions/pull/2

## [0.1.0] - 2022-08-27

- Initial release
