# frozen_string_literal: true

class Jabroni::Loader
  def initialize(klass, path)
    @klass, @name = klass, klass.name
    @directory_name = File.join path.match(/(?=\/extensions|\.rb)/).pre_match, "extensions/"
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
      @directory_name + "#{extension}.rb"
    end

    def load_one(extension)
      contents = File.read extension

      case
      when contents.match?(/\s*class #{@name}/)
        require extension
      when !$LOADED_FEATURES.include?(extension)
        $LOADED_FEATURES << extension
        @klass.class_eval contents, extension, 0
      end
    end
end
