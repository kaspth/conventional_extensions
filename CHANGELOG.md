## [Unreleased]

- Ignore extensions folders automatically in Rails.

  We've added a Railtie which automatically ignores every extensions folder by running `Rails.autoloaders.main.ignore "**/extensions/**.rb"`.

  Fixed #8.

- Remove automatic extension loading for Active Records.

  Due to the automatic extension loading in Active Record, there was no way for people to manually call `load_extensions` if they wanted to. And implementation wise there wasn't a way to sort that out. So the automatic loading support is out.

  Though you can get the old behavior back with this, which calls `load_extensions` when a new class inherits from `ApplicationRecord`:

  ```ruby
  # app/models/application_record.rb
  class ApplicationRecord < ActiveRecord::Base
    extend ConventionalExtensions.load_on_inherited
  end
  ```

  Fixed #10.

## [0.3.0] - 2022-09-27

- Fixes defining a nested extension, e.g. `Organization::User` with `app/models/organization/user/extensions/`.
- Removes support for defining a nested extension within the namespace file. I couldn't unify it with the fix above, so it went.

## [0.2.2] - 2022-09-08

- Fixes Zeitwerk 2.6.0 compatibility issue where extensions wouldn't load and throw an exception. See https://github.com/kaspth/conventional_extensions/commit/7fc25f1e860637e8df9fd0e81e7ca038c8c34aa0

## [0.2.1] - 2022-09-07

- Fixes `extend ConventionalExtensions.load_on_inherited` not finding the right directory to load extensions from. See https://github.com/kaspth/conventional_extensions/commit/1f6fe9cbf2fe44ed9d699a5dd485eaa366d875a4

## [0.2.0] - 2022-08-27

- Replaces the use of `::Kernel.require` with `::Kernel.load` and replaces the `$LOADED_FEATURES` tracking with an internally maintained `Set` for better Zeitwerk (Rails autoloading) inter op. See https://github.com/kaspth/conventional_extensions/pull/2

## [0.1.0] - 2022-08-27

- Initial release
