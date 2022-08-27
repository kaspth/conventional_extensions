# frozen_string_literal: true

require_relative "jabroni/version"

module Jabroni
  class Error < StandardError; end

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
        contents = File.read extension

        case
        when contents.gsub(/^\#.*?\n+/m, "").start_with?("class #{name}")
          require extension
        when !$LOADED_FEATURES.include?(extension)
          $LOADED_FEATURES << extension
          class_eval contents, extension, 0
        end
      end
  end
end
