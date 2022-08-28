# frozen_string_literal: true

require "set"

class ConventionalExtensions::Loader
  def initialize(klass, path)
    @loaded, @klass, @matcher = Set.new, klass, /\s*class #{klass.name}/
    @directory_name = File.join path.chomp(".rb"), "extensions"
  end

  def load(*extensions)
    paths = extensions.empty? ? extension_paths : extensions.map { extension_path_for _1 }
    paths.each { load_one _1 }
  end

  private
    def extension_paths
      Dir.glob extension_path_for("*")
    end

    def extension_path_for(extension)
      File.join @directory_name, "#{extension}.rb"
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
