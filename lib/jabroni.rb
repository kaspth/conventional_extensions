# frozen_string_literal: true

require_relative "jabroni/version"

module Jabroni
  class Error < StandardError; end

  autoload :Loader, "jabroni/loader"

  module LoadOnInherited
    extend Jabroni

    def inherited(klass)
      klass.load_extensions
    end
  end

  # extend Jabroni.load_on_inherited
  def self.load_on_inherited
    LoadOnInherited
  end

  def load_extensions(*extensions)
    Loader.new(self).load extensions
  end
  alias load_extension load_extensions
end
