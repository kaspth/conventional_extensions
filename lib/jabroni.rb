# frozen_string_literal: true

require_relative "jabroni/version"

module Jabroni
  class Error < StandardError; end

  autoload :Loader, "jabroni/loader"

  class << self
    def inherited(klass)
      Dir.glob("#{Dir.pwd}/#{klass.name.downcase}/extensions/*.rb").each do |extension|
        klass.load_extension extension
      end
    end

    def require_extensions(*extensions)
      extensions.each do |extension|
        load_extension "#{Dir.pwd}/#{name.downcase}/extensions/#{extension}.rb"
      end
    end
    alias require_extension require_extensions

    private
      def load_extension(extension)
        Loader.new(self).load extension
      end
  end
end
