# frozen_string_literal: true

require_relative "jabroni/version"

module Jabroni
  class Error < StandardError; end

  autoload :Loader, "jabroni/loader"

  class << self
    def inherited(klass)
      Dir.glob("#{Dir.pwd}/#{klass.name.downcase}/extensions/*.rb").each do |extension|
        Loader.new(klass).load File.basename(extension).chomp(".rb")
      end
    end

    def require_extensions(*extensions)
      extensions.each { Loader.new(self).load _1 }
    end
    alias require_extension require_extensions
  end
end
