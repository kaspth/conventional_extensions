# frozen_string_literal: true

require "set"

class ConventionalExtensions::Loader
  def initialize(klass, path)
    @loaded, @klass, @matcher = Set.new, klass, /\s*class #{klass.name}/
    @path_format = File.join File.dirname(path), underscore(klass.name), "extensions", "%s.rb"
  end

  def load(*extensions)
    paths = extensions.empty? ? extension_paths : extensions.map { extension_path_for _1 }
    paths.each { load_one _1 }
  end

  private
    # Logic borrowed from Active Support:
    # https://github.com/rails/rails/blob/a2fc96a80cf26c11df3e86e86c1b2b61736af80c/activesupport/lib/active_support/inflector/methods.rb#L99
    def underscore(name)
      name.gsub("::", "/").tap { _1.gsub!(/([A-Z]+)(?=[A-Z][a-z])|([a-z\d])(?=[A-Z])/) { ($1 || $2) << "_" } }.tap(&:downcase!)
    end

    def extension_paths
      Dir.glob extension_path_for("*")
    end

    def extension_path_for(extension)
      @path_format % extension.to_s
    end

    def load_one(extension)
      if @loaded.add?(extension)
        if contents = File.read(extension) and contents.match?(@matcher)
          ::Kernel.load extension
        else
          @klass.class_eval contents, extension, 0
        end
      end
    end
end
