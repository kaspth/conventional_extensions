# frozen_string_literal: true

require_relative "jabroni/version"

module Jabroni
  class Error < StandardError; end

  autoload :Loader, "jabroni/loader"

  class << self
    def inherited(klass)
      Loader.new(klass).load_all
    end

    def load_extensions(*extensions)
      Loader.new(self).load extensions
    end
    alias load_extension load_extensions
  end
end
