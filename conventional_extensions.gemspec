# frozen_string_literal: true

require_relative "lib/conventional_extensions/version"

Gem::Specification.new do |spec|
  spec.name    = "conventional_extensions"
  spec.version = ConventionalExtensions::VERSION
  spec.authors = ["Kasper Timm Hansen"]
  spec.email   = ["hey@kaspth.com"]

  spec.summary  = "ConventionalExtensions sets up a file naming convention to extend your domain model"
  spec.homepage = "https://github.com/kaspth/conventional_extensions"
  spec.license  = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"]    = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"]   = "#{spec.homepage}/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
