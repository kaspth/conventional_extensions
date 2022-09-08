# frozen_string_literal: true

require_relative "conventional_extensions/version"

module ConventionalExtensions
  Object.extend self # We're enriching object itself, so any object can call `load_extensions`.

  def load_extensions(*extensions, from: Frame.previous.path)
    @loader = Loader.new(self, from) unless loader_defined_before_entrance = defined?(@loader)
    @loader.load(*extensions)
  ensure
    @loader = nil unless loader_defined_before_entrance
  end
  alias load_extension load_extensions

  # extend ConventionalExtensions.load_on_inherited
  def self.load_on_inherited() = LoadOnInherited

  module LoadOnInherited
    def inherited(klass)
      super
      klass.load_extensions from: Frame.previous.path
    end
  end

  module Frame
    def self.previous
      caller_locations(2, 1).first # Use 2 instead of 1 so we get the frame of who called us.
    end
  end

  autoload :Loader, "conventional_extensions/loader"
end

defined?(ActiveSupport.on_load) and ActiveSupport.on_load(:active_record) { extend ConventionalExtensions.load_on_inherited }
