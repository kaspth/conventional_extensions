# frozen_string_literal: true

require_relative "jabroni/version"

module Jabroni
  class Error < StandardError; end

  autoload :Loader, "jabroni/loader"

  class << self
    def load_extensions() = jabroni_loader.load_all
    def jabroni_loader() = Loader.new(self)

    def inherited(klass)
      klass.load_extensions
    end

    def require_extensions(*extensions)
      extensions.each { Loader.new(self).load _1 }
    end
    alias require_extension require_extensions
  end
end
