class Jabroni::Loader
  def initialize(klass)
    @klass = klass
  end

  def load(extension)
    load_one extension_path_for(extension)
  end

  private
    def extension_path_for(extension)
      File.expand_path "#{@klass.name}/extensions/#{extension}.rb"
    end

    def load_one(extension)
      contents = File.read extension

      case
      when contents.gsub(/^\#.*?\n+/m, "").start_with?("class #{@klass.name}")
        require extension
      when !$LOADED_FEATURES.include?(extension)
        $LOADED_FEATURES << extension
        class_eval contents, extension, 0
      end
    end
end
