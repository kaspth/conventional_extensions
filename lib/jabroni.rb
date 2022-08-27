# frozen_string_literal: true

require_relative "jabroni/version"

module Jabroni
  Object.extend self # We're enriching object itself, so any object can call `load_extensions`.

  def load_extensions(*extensions)
    Loader.new(self).load(*extensions)
  end
  alias load_extension load_extensions

  # extend Jabroni.load_on_inherited
  def self.load_on_inherited() = LoadOnInherited

  module LoadOnInherited
    def inherited(klass)
      super
      klass.load_extensions
    end
  end

  autoload :Loader, "jabroni/loader"
end

defined?(ActiveSupport.on_load) and ActiveSupport.on_load(:active_record) { extend Jabroni.load_on_inherited }
