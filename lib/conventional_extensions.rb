# frozen_string_literal: true

require_relative "conventional_extensions/version"

module ConventionalExtensions
  Object.extend self # We're enriching object itself, so any object can call `load_extensions`.

  def load_extensions(*extensions)
    Loader.new(self, caller_locations(1, 1).first.path).load(*extensions)
  end
  alias load_extension load_extensions

  # extend ConventionalExtensions.load_on_inherited
  def self.load_on_inherited() = LoadOnInherited

  module LoadOnInherited
    def inherited(klass)
      super
      klass.load_extensions
    end
  end

  autoload :Loader, "conventional_extensions/loader"
end

defined?(ActiveSupport.on_load) and ActiveSupport.on_load(:active_record) { extend ConventionalExtensions.load_on_inherited }
