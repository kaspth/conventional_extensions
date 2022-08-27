# frozen_string_literal: true

require_relative "jabroni/version"

module Jabroni
  autoload :Loader, "jabroni/loader"

  module LoadOnInherited
    extend Jabroni

    def inherited(klass)
      super
      klass.load_extensions
    end
  end

  # extend Jabroni.load_on_inherited
  def self.load_on_inherited
    LoadOnInherited
  end

  def load_extensions(*extensions)
    Loader.new(self).load(*extensions)
  end
  alias load_extension load_extensions
end

defined?(ActiveSupport.on_load) and ActiveSupport.on_load(:active_record) { extend Jabroni.load_on_inherited }
